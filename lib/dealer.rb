require 'forwardable'
class Dealer
  extend Forwardable
  attr_accessor :hand, :deck
  def initialize(deck = nil,hand = nil)
    @deck = deck || Deck.new
    @hand = hand || Hand.new
  end

  def name
    "Dealer"
  end

  def to_s
    name
  end

  def_delegators :@deck, :deal_card, :shuffle
  def_delegators :@hand, :score, :reset!, :cards
end