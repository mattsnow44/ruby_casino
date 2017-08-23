require_relative 'player'
require_relative 'wallet'
require 'pry'

class Slots
  attr_accessor :player, :casino
  def initialize(player, casino)
    @casino = casino
@player=player
  insert_money

  end
def insert_money
  puts "Welcome to Slots #{@player.name}"
  puts "Rules: Place your bet then spin the wheel!!!"
  puts "If you match 3 numbers, YOU WIN!!!"
  puts "if you don't match any numbers, YOU LOSE"
  puts
  puts "1: Play"
  puts "2: Leave spot at the Slots"
  input = gets.strip
    if  input == '1' && @player.wallet.amount >= 1
      bet(@player)
    elsif input =='2'
      puts "Have a nice day!!!"
      Casino
    elsif input != ['1'..'2']
      insert_money
    else input == '1' && @player.wallet.amount == 0
      puts "Sorry but you are broke, come back when you have more money!"
      exit
    end
  end
  def bet(player)
    puts "You have $#{@player.wallet.amount} to bet with!"
    puts "How much do you want to bet?"
    print "$"
    wager = gets.to_i
    if wager > player.wallet.amount
     puts "Thats more than you have."
     bet(@players)
   elsif wager < 1
      puts "Must bet at least $1"
      bet(@player)
    else
      play(player, wager)
    end
  end
  def roll
    @probability = ['cherry', 'cherry', 'cherry', 'bar', 'bar', 'bar', '7', '7', '7']
    spin_results = []
    spin_results << @probability.sample
    spin_results << @probability.sample
    spin_results << @probability.sample
  end

  def play(player, bet)
    puts "Press Enter to SPIN!!!"
    spin_results = roll
    if spin_results == [ 'cherry', 'cherry', 'cherry' ]
      puts 'WINNER!!!'
      player.wallet.add(bet * 5)
      insert_money
    elsif
      spin_results == [ 'BAR', 'BAR', 'BAR' ]
      puts 'WINNER!!!'
      player.wallet.add(bet * 10)
    elsif
      spin_results == [ '7', '7', '7' ]
      puts 'WINNER!!!'
      player.wallet.add(bet * 77)
    else
      puts
      puts "#{spin_results[0]} - #{spin_results[1]} - #{spin_results[2]}"
      puts "You Lose."
      player.wallet.subtract(bet)
      insert_money
    end
    insert_money
  end
end
