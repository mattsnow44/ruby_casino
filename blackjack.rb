require_relative 'deck'
require 'colorize'

d = Deck.new

d.cards.shuffle!

d.cards.each do |element|
  puts "This is a #{element.rank} of #{element.suit}."
end

def deal(d)
  player_hand = []
  dealer_hand = []
  player_hand << d.cards.shift
  dealer_hand << d.cards.shift
  player_hand << d.cards.shift
  dealer_hand << d.cards.shift
  display_hand(player_hand)
end

def display_hand(hand)
  total = 0
  ace = 0
  print "Your Hand: "
  hand.each do |element|
    puts "#{element.rank} of #{element.suit}"
    if element.rank == 'J' || element.rank == 'Q' || element.rank == 'K'
      puts "This card is worth 10"
      total += 10
    elsif element.rank == 'A'
      puts "This card is worth 1 or 11"
      ace += 1
      total += 11
    else
      puts "This card is worth #{element.rank}"
      total += element.rank.to_i
    end
  end
  binding.pry
  while ace > 0 && total > 21
    total -= 10
    ace -= 1
  end
  puts "Total = #{total}"
end

deal(d)
