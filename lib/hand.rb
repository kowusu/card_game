class Hand
  attr_accessor :cards
  def initialize(cards=[])
    @cards = cards
  end

  def score
    @cards.inject(0) do |score, card|
      score += card.value
    end
  end

  def reset!
    @cards = []
  end
end