class Board
  attr_accessor :cells

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    reset!
  end

  def display
    a = taken?("1") ? "#{cells[0]}".light_yellow.on_red : "1".light_black.on_red
    b = taken?("2") ? "#{cells[1]}".light_yellow.on_red : "2".light_black.on_red
    c = taken?("3") ? "#{cells[2]}".light_yellow.on_red : "3".light_black.on_red
    d = taken?("4") ? "#{cells[3]}".light_yellow.on_red : "4".light_black.on_red
    e = taken?("5") ? "#{cells[4]}".light_yellow.on_red : "5".light_black.on_red
    f = taken?("6") ? "#{cells[5]}".light_yellow.on_red : "6".light_black.on_red
    g = taken?("7") ? "#{cells[6]}".light_yellow.on_red : "7".light_black.on_red
    h = taken?("8") ? "#{cells[7]}".light_yellow.on_red : "8".light_black.on_red
    i = taken?("9") ? "#{cells[8]}".light_yellow.on_red : "9".light_black.on_red
    puts " #{a} | #{b} | #{c} ".on_red
    puts "-----------".light_yellow.on_red
    puts " #{d} | #{e} | #{f} ".on_red
    puts "-----------".light_yellow.on_red
    puts " #{g} | #{h} | #{i} ".on_red
  end

  def display_positions
    puts " 1 | 2 | 3 ".light_black.on_red
    puts "-----------".light_black.on_red
    puts " 4 | 5 | 6 ".light_black.on_red
    puts "-----------".light_black.on_red
    puts " 7 | 8 | 9 ".light_black.on_red
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
