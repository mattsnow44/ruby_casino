class Wallet
  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end

  def add(amount)
    @amount += amount
    puts "You now have $#{@amount} left to play with."
  end

  def subtract(amount)
    @amount -= amount
    puts "You now have $#{@amount} left to play with."
  end


  #TODO: should have other methods to add or sub from wallet
end
