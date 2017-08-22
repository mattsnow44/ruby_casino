require 'pry'
require_relative 'player'
require_relative 'high_low'
require_relative 'wallet'
require_relative 'roulette'
require_relative 'blackjack'
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
    puts "2) Roulette"
    puts "3) Slots"
    puts "4) Black Jack"
    puts "4) Quit"
    case gets.to_i
    when 1
      HighLow.new(@player)
    when 2
      Roulette.new(@player)
    when 3
      Slots.new(@player)
    when 4
      Blackjack.new(@player)
    when 5
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
