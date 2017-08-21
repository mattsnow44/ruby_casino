require_relative 'player'
require_relative 'wallet'
require 'pry'

class HighLow
  def initialize(player)
    puts "Welcome to High Low #{player.name}"
    puts "Rules: Two dice will roll, if the number is 8 or above it is high,
    if it is 6 or below it is low, if it is 7 its even."
    puts "High or low pay out 2:1.
          Even pay out 4:1"
    puts "1: Play"
    puts "2: Leave the table"
    input = gets.strip
      if  input == '1' && player.wallet.amount >= 20
        bet(player)
      elsif
        puts "Thanks for playing but you're out of money!!!"
        puts "Have a nice day!!!"
        exit
      else
      end
  end

  def bet(player)
    #puts "You have \$#{player.wallet.amount} to bet with!"
    puts "How much do you want to bet?"
    print "$"
    bet = gets.to_f
    if bet > player.wallet.amount
     puts "Thats more than you have."
     bet(player)
    elsif bet < 20.0
      puts "Must bet at least $20"
      bet(player)
    else
      play(player, bet)
    end
  end

  def play(player, bet)
    puts "High, Low or Even?"
    input = gets.strip.downcase
    dice_roll = rand(2..12)
    puts "dice roll = #{dice_roll}"
    if (input == 'high' && dice_roll >= 8) || (input == 'low' && dice_roll <= 6 )
      puts "Winner!"
      player.wallet.add(bet)
    elsif input == 'even' && dice_roll == 7
      puts "Big Winner!"
      player.wallet.add(bet*3)
    else
      puts "You Lose."
      player.wallet.subtract(bet)
    end
    initialize(player)
  end
end
