require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton # ensures that we have one instance of our DB so that no matter how many times we call on the methods, there will only be one instance

  def initialize
    super('plays.db') # parent class is the SQLite3 DB
    self.type_translation = true # this ensures that the data recieved is the same as the the data passed into the DB (re: anything that is an integer, will come back as an integer and not as a string passed as an integer)
    self.results_as_hash = true # this transforms the data into a hash rather than an array (every column is the key and the information in the column is the value)
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all # this will show us every entry in our play DB
    data = PlayDBConnection.instance.execute("SELECT * FROM plays") # this returns to us an array of hashes, where each hash represents a row
    data.map { |datum| Play.new(datum) } # this implements the ORM aspect
  end

  def self.find_by_title(title)
    data = PlayDBConnection.instance.execute(<<-SQL, @title)
      SELECT
        *
      FROM
        plays
      WHERE
        title = ?
    SQL
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)

    raise 'error' unless playwright

    data = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options) # this argument (the options hash) will come in one of two ways: 1. it will either come in from the class method all or 2. the user will create an instance of the Play class. If the user is creating the instance, 3 of the 4 options will be defined. The one that won't be defined is the id, which will be defined by our table.
    @id = options['id'] # will either be defined or nil (nil because the user won't define it)
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create # allows us to save the instance to our DB
    raise "#{self} already in database" if @id # ensures that nothing is added to the DB that isn't already there
    # underneath: this is a heredoc, which allows us to embed code that will be read in as a string. Begins with: <<-SQL, Ends with: SQL.
    # since we don't have the values from the instance yet, we can substitute with ?s. This protects against SQL injection attacks (re: malicious users). When we use the ?s (the bind arguments), the gem will sanitize malicious input.
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id # shouldn't be calling update if the instance doesn't exist yet in our db
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL

    return nil if data.length == 0

    data.map { |datum| Playwright.new(datum) }.first
  end

  attr_accessor :name, :birth_year
  attr_reader :id

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
      UPDATE
        playwrights
      SET
        name = ?, birth_year = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    data = PlayDBConnection.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwright_id = ?
    SQL
    data.map { |datum| Play.new(datum) }
  end

end
