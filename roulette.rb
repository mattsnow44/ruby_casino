require_relative 'player'
require_relative 'wallet'
require 'pry'
require 'colorize'
require 'colorized_string'


class Roulette
  def initialize(player)
    @number = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
      21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
      @color = [ 'red', 'black']
    puts "                                                             ".colorize(:light_magenta).on_blue
    puts "                  ~                       ~                  ".colorize(:light_magenta).on_blue
    puts "                     Welcom to Roulette!!                    ".colorize(:light_magenta).on_blue
    puts "                  ~                       ~                  ".colorize(:light_magenta).on_blue
    puts "                                                             ".colorize(:light_magenta).on_blue
    puts "The rules:".colorize(:yellow)
    puts "In the game, players may choose to place bets on either
          a single number or a range of numbers, the colors red or black,
          or whether the number is odd or even,
          or if the numbers are high (19–36) or low (1–18)."
    puts ""
    puts "You have #{player.wallet.amount} to play with.".colorize(:light_red)
    puts ""
    puts ""
    puts "1: Play".colorize(:cyan)
    puts "2: Leave the table".colorize(:cyan)
    input = gets.strip
    if input == '1' && player.wallet.amount >= 10
      bet(player)
    else
      puts "Thanks for your donations, come back with more money!"
      exit
    end
  end

 def bet(player)
    puts ""
    puts "How much do you want to bet?".colorize(:yellow)
    print "$".colorize(:blue)
    bet = gets.to_f
    if bet > player.wallet.amount
     puts "Thats more than you have.".colorize(:red)
     bet(player)
   elsif bet < 10.0
      puts "Must bet at least $10".colorize(:red)
      bet(player)
    else
      play(player, bet)
    end
  end

 def play(player, bet)
    puts ""
    puts "Place one bet: High, Low, Odd, Even,
    Black, Red, or any number."
    input = gets.strip.downcase
    number_spin = @number.sample
    color_spin = @color.sample
    puts "Number = #{number_spin}"
    puts "Color = #{color_spin}"
    case input
      when 'black'
        if input == color_spin
          win(player, bet)
        else
          lose(player, bet)
        end
      when 'red'
        if input == color_spin
          win(player, bet)
        else
          lose(player, bet)
        end
      when 'high'
        if number_spin >= 19
          win(player, bet)
        else
          lose(player, bet)
        end
      when 'low'
        if number_spin <= 18
          win(player, bet)
        else
          lose(player, bet)
        end
      when 'even'
        if number_spin % 2 == 0
          win(player, bet)
        else
          lose(player, bet)
        end
      when 'odd'
        if number_spin % 2 != 0
          win(player, bet)
        else
          lose(player, bet)
        end
      else
        if input.to_i == number_spin
          win(player, bet)
      else
          lose(player, bet)
      end
    end
  end



 def win(player, bet)
    puts "Congrats!".colorize(:green)
    player.wallet.add(bet)
    initialize(player)
  end

 def lose(player, bet)
    puts "Too bad!".colorize(:magenta)
    player.wallet.subtract(bet)
    initialize(player)
  end
end
