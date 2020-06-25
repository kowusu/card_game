class Card
  attr_accessor :suit, :face, :value
  
  def initialize(suit, face, value)
    @suit = suit
    @face = face
    @value = value
  end

  def to_s
    "#{face} of #{suit}"
  end
end