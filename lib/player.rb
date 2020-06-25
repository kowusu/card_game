require 'forwardable'
class Player
  extend Forwardable
  attr_accessor :name, :hand

  def initialize(name,hand=nil)
    @name = name
    @hand = hand || Hand.new
  end

  def to_s
    name
  end

  def_delegators :@hand, :score, :reset!, :cards
end