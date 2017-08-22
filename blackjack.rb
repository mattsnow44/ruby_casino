require_relative 'deck'
require 'colorize'
require_relative 'player'


class Blackjack
  def initialize(player)
    @d = Deck.new
    @d.cards.shuffle!
    @dealer_total = 0
    @player_total= 0
    puts "Welcome to the $20 Blackjack table, #{player.name}!"
    puts "1) Play"
    puts "2) Leave Table"
    input = gets.to_i
    if input == 1 && player.wallet.amount >= 20
      bet = bet(player)
      deal
      finish(player, bet)
    else
    end
    if player.wallet.amount < 20
      puts "You don't have enough money to play."
    end
  end

  def bet(player)
    puts "You have $#{player.wallet.amount} in your wallet."
    puts "How much would you like to bet?"
    print "$"
    bet = gets.to_f
    if bet > player.wallet.amount
      puts "That's more than you have."
      bet(player)
    elsif bet < 20
      puts "You must bet at least $20 to play."
    else
      player.wallet.amount -= bet
      puts "You have #{player.wallet.amount} left in your wallet."
      return bet
    end
  end

  def deal
    player_hand = []
    dealer_hand = []
    player_hand << @d.cards.shift
    dealer_hand << @d.cards.shift
    player_hand << @d.cards.shift
    dealer_hand << @d.cards.shift
    puts "Dealer shows #{dealer_hand[0].rank} of #{dealer_hand[0].suit}"
    play(player_hand)
    dealer_play(dealer_hand) unless @player_total > 21
  end

  def play(hand)
    puts "Your Hand: "
    @player_total = display_hand(hand)
    @player_total = mid_game_menu(hand, @player_total)
  end

  def dealer_play(hand)
    puts "Dealer's Hand:"
    @dealer_total = display_hand(hand)
    @dealer_total = dealer_a_i(hand, @dealer_total)
  end


  def display_hand(hand)
    total = 0
    ace = 0
    hand.each do |element|
      puts "#{element.rank} of #{element.suit}"
      if element.rank == 'J' || element.rank == 'Q' || element.rank == 'K'
        total += 10
      elsif element.rank == 'A'
        ace += 1
        total += 11
      else
        total += element.rank.to_i
      end
    end
    while ace > 0 && total > 21
      total -= 10
      ace -= 1
    end
    puts "Total = #{total}"
    total
  end

  def mid_game_menu(hand, total)
    while total <= 21
      puts "1) Hit"
      puts "2) Stand"
      decision = gets.to_i
      if decision == 1
        hand << @d.cards.shift
        puts "Your Hand:"
        total = display_hand(hand)
      else
        return total
      end
    end
    total
  end

  def dealer_a_i(hand, total)
    while total < 17
      hand << @d.cards.shift
      total = dealer_play(hand)
    end
    total
  end

  def finish(player, bet)
    if @player_total > 21
      puts "Bust!".red
      lose(player)
    elsif @dealer_total > 21
      puts "Dealer Bust!  You Win!".green
      win(player, bet)
    else
      puts "You have #{@player_total}, Dealer has #{@dealer_total}."
      if @player_total > @dealer_total
        win(player, bet)
      elsif @dealer_total > @player_total
        lose(player)
      else
        standoff(player, bet)
      end
    end
      initialize(player)
  end

  def win(player, bet)
    puts "You win!".green
    player.wallet.add(bet*2)
  end

  def lose(player)
    puts "You lose.".red
    puts "You now have $#{player.wallet.amount} left to play with."
  end

  def standoff(player, bet)
    puts "Standoff.".yellow
    player.wallet.add(bet)
  end
end
