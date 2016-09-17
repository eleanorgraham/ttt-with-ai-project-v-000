class Cli

  def self.welcome
    #binding.pry
    puts "Hello, Welcome to Tic Tac Toe!".light_cyan.on_blue
    sleep(1)
    self.start
  end

  def self.start
    puts "What kind of game would you like to play: 0, 1, or 2 players?".light_cyan.on_blue
    input = gets.strip
    if input == "0"
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      self.play_game(game)
    elsif input == "1"
      puts "Who should go first and be 'X'? (Human/Computer)".light_cyan.on_blue
      input = gets.strip.upcase
      case input
      when "HUMAN"
          game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
          self.play_game(game)
      when "COMPUTER"
          game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
          self.play_game(game)
      else
          puts "I didn't understand that.".light_cyan.on_blue
          puts "Who should go first and be 'X'? (Human/Computer)".light_cyan.on_blue
          input = gets.strip.upcase
      end
    elsif input == "2"
      game = Game.new
      self.play_game(game)
    elsif input == "wargames"
      puts "Executing wargames".light_cyan.on_blue
      sleep(0.5)
      Game.wargames
      puts "Game 100".light_cyan.on_blue
      sleep(0.1)
      game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
      self.play_game(game)
    else
      puts "I didn't understand that.".light_cyan.on_blue
      self.start
    end
  end

  def self.play_game(game)
    game.play
    sleep(1)
    self.play_again?
  end

  def self.play_again?
    puts "Would you like to play again? (Y/N)".light_cyan.on_blue
    input = gets.strip.upcase
    if input == "Y"
      self.start
    elsif input == "N"
      puts "Thanks for playing!".light_cyan.on_blue
    else
      puts "I didn't understand that.".light_cyan.on_blue
      self.play_again?
    end
  end
end
