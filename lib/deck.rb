class Deck

  def initialize
    @suits = ['Spades', 'Clubs', 'Hearts', 'Diamonds']
    @faces = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King' ]
    reset!
  end

  def reset!
    @cards = []
    @suits.each do |suit|
      @faces.each_with_index do |face, index|
        @cards << Card.new(suit, face, index+1)
      end
    end
  end

  def shuffle
    @cards.shuffle!
  end

  def deal_card
    @cards.shift
  end
end