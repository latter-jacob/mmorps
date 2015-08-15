require "sinatra"
require 'pry'

# class Mmorps
#
#   def game
#     Game.new(:computer_name, :human_name, :player_choice, :computer_choice)
#   end
#
#   def competitor
#     Competitor.new("computer", computer_choice)
#   end
#
# end


class Game
  attr_reader :computer_name, :human_name, :player_choice, :computer_choice

  # attr_reader :computer_name, :human_name, :player_choice, :computer_choice
    def initialize(computer_name, computer_choice)
      @computer_name = computer_name
      @human_name =human_name
      @player_choice = player_choice
      @computer_choice = computer_choice

    end

    def winner
      if computer_choice == "rock" && player_choice == "scissors"
        computer_name
      elsif computer_choice == "rock" && player_choice == "paper"
        player_name
      elsif computer_choice == "scissors" && player_choice == "rock"
        player_name
      elsif computer_choice == "scissors" && player_choice == "paper"
        computer_name
      elsif computer_choice == "paper" && player_choice == "rock"
        computer_name
      elsif computer_choice == "paper" && player_choice == "scissors"
        player_name
      else
        tie
      end
    end

    def tie
      "tie"
    end

end


class Competitor
  attr_reader :name, :wins
  attr_accessor :player_choice, :choice

  def initialize(name, choice, wins = 0)
    @name = name
    @choice = choice
    @wins = wins
  end


  def add_win
    @wins += 1
  end

end

get "/choose" do
  erb :choose
end

post "/choose" do
  player_choice = params[:choice]
  @human = Competitor.new("human", @player_choice)
  redirect "/choose"
end

def computer_choice
    pick_computer= [ "rock", "paper", "scissors"]
    choice = pick_computer.sample
end


computer = Competitor.new("computer", computer_choice )

super_game = Game.new(computer.name, computer.choice)

# super_game = Game.new(computer.name, @human.name, @human.choice, computer.choice)

binding.pry



use Rack::Session::Cookie, {
  secret: "keep_it_secret_keep_it_safe"
}
