class Board
  attr_accessor :cells

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    reset!
  end

  def display
    a = taken?("1") ? "#{cells[0]}".light_cyan.on_blue : "1".light_blue.on_blue
    b = taken?("2") ? "#{cells[1]}".light_cyan.on_blue : "2".light_blue.on_blue
    c = taken?("3") ? "#{cells[2]}".light_cyan.on_blue : "3".light_blue.on_blue
    d = taken?("4") ? "#{cells[3]}".light_cyan.on_blue : "4".light_blue.on_blue
    e = taken?("5") ? "#{cells[4]}".light_cyan.on_blue : "5".light_blue.on_blue
    f = taken?("6") ? "#{cells[5]}".light_cyan.on_blue : "6".light_blue.on_blue
    g = taken?("7") ? "#{cells[6]}".light_cyan.on_blue : "7".light_blue.on_blue
    h = taken?("8") ? "#{cells[7]}".light_cyan.on_blue : "8".light_blue.on_blue
    i = taken?("9") ? "#{cells[8]}".light_cyan.on_blue : "9".light_blue.on_blue
    puts " #{a} | #{b} | #{c} ".on_blue
    puts "-----------".light_cyan.on_blue
    puts " #{d} | #{e} | #{f} ".on_blue
    puts "-----------".light_cyan.on_blue
    puts " #{g} | #{h} | #{i} ".on_blue
  end

  def display_positions
    puts " 1 | 2 | 3 ".light_blue.on_blue
    puts "-----------".light_blue.on_blue
    puts " 4 | 5 | 6 ".light_blue.on_blue
    puts "-----------".light_blue.on_blue
    puts " 7 | 8 | 9 ".light_blue.on_blue
  end

  def position(input_string)
    cells[input_string.to_i-1]
  end

  def update(input_string, player)
    cells[input_string.to_i-1] = player.token
  end

  def full?
    cells.none?{|cell| cell == " "}
  end

  def turn_count
    cells.count {|cell| cell != " "}
  end

  def taken?(input_string)
    position(input_string) != " "
  end

  def valid_move?(input_string)
    !taken?(input_string) && (input_string.to_i).between?(1,9)
  end

end
