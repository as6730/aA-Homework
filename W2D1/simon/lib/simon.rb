class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length = 1, game_over = false, seq = [])
    @sequence_length = sequence_length
    @game_over = game_over
    @seq = seq
  end

  def play
    until game_over
      self.take_turn
    end

    if game_over
      self.game_over_message
      self.reset_game
    end
  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless self.game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color

    @seq.each {|color| puts color}
  end

  def require_sequence
    puts "Repeat sequence by entering the first letter of each color. Ex: 'RBGGY'"

    user_input = gets.chomp

    comp_seq = @seq.map {|color| color[0].upcase }.join("")
    if comp_seq != user_input
      self.game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Successful Round. Now let's see if you can remember this:"
  end

  def game_over_message
    puts "Game over! You completed #{@sequence_length - 1} rounds." if @game_over = true
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end 
