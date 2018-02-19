require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    self.place_stones
  end

  def place_stones
    (0...@cups.length).each do |cup_idx|
      unless cup_idx == 6 || cup_idx == 13
        @cups[cup_idx] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 13
    raise 'Invalid starting cup' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []

    opponent_cup = current_player_name == @name1 ? 13 : 6
    next_pos = start_pos + 1
    while stones.length > 0
      if next_pos % @cups.length == opponent_cup
        next_pos += 1
        next
      end

      @cups[next_pos % @cups.length] << stones.pop
      next_pos += 1
    end

    self.render
    self.next_turn((next_pos - 1) % @cups.length, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    is_player1 = current_player_name == @name1

    if is_player1
      return :prompt if ending_cup_idx == 6
    else
      return :prompt if ending_cup_idx == 13
    end

    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def is_side_1_empty?
    (0..5).all? { |idx| @cups[idx].empty? }
  end

  def is_side_2_empty?
    (7..12).all? { |idx| @cups[idx].empty? }
  end

  def one_side_empty?
    if self.is_side_1_empty? || self.is_side_2_empty?
      return true
    end

    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length

    @cups[6].length >= @cups[13].length ? @name1 : @name2
  end
end
