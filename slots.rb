require_relative 'player'
require_relative 'wallet'

class Slots
  def initialize(player)
    first_slot = ["BAR","$$$",""]
    second_slot = ["BAR","$$$",""]
    third_slot = ["BAR","$$$",""]
    first_slot.sample = slot_1
    second_slot.sample = slot_2
    thrid_slot.sample = slot_3
    if slot_1 == slot_2 && slot_2 == slot_3
      player.wallet.amount = player.wallet.amount


    puts "Welcome to Slots #{player.name}"
    puts "Rules: Place your bet of either $1, $2, or $5, then spin the wheel!!!"
    puts "If you match 3 numbers, YOU WIN!!!"
    puts "If you match 2 numbers, SPIN AGAIN!!!"
    puts "if you don't match any numbers, YOU LOSE"
    puts "$1 odds are 50:1"
    puts "$2 odds are 100:1"
    puts "$5 odds are 500:1"
    puts
    puts "1: Play"
    puts "2: Leave spot at the Slots"
    input = gets.strip
      if  input == '1' && player.wallet.amount >= 1
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
   elsif bet < 1
      puts "Must bet at least $1"
      bet(player)
    else
      play(player, bet)
    end
  end

  def play(player, bet)
    puts "Press Enter to SPIN!!!"
    @number.sample
    else
      puts "You Lose."
      player.wallet.subtract(bet)
    end
    initialize(player)
  end
end
