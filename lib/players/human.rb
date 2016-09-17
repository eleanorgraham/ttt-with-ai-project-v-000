module Players
  class Human < Player

    def move(board= nil)
      puts "Where would you like to move? Please input a location, 1 - 9".light_cyan.on_blue
      input = gets.strip
      input
    end
  end
end
