require 'pry'
require_relative 'player'
require_relative 'high_low'
require_relative 'wallet'

class Casino
  attr_accessor :players

  def initialize
    puts 'Welcome To The Ruby Casino'
    @player = Player.new
    menu
  end

  def menu
    exit if out_of_money
    puts "1) High Low"
    puts "2) Quit"
    case gets.to_i
    when 1
      HighLow.new(@player)
    when 2
      puts 'Thanks for playing'
      exit
    else
      puts 'Invalid Choice! Try Again'
      menu
    end
    menu
  end
  def out_of_money
    @player.wallet.amount == 0
  end
end

Casino.new
