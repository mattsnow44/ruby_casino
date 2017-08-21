require 'pry'
require_relative 'player'

class Casino
  attr_accessor :players

  def initialize
    puts 'Welcome To The Ruby Casino'
    @player = Player.new
  end
end

Casino.new
