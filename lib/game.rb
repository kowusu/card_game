class Game
  def self.play
    dealer = Dealer.new
    players = (1..5).collect { |i| ::Player.new("Player #{i}") } + [dealer]
    puts "Let's Play a Game of Cards"

    while true
      dealer.shuffle
      players.each do |player|
        2.times do
          player.cards << dealer.deal_card
        end
        puts  "Dealer has dealt #{player.name} cards #{player.cards[0]} and #{player.cards[1]}"
      end
      players = players.sort_by {|p| -p.score }
      potential_winner = players.select {|p| p.score == players[0].score }
      if potential_winner.count > 1 
        puts "We have a tie"
        puts "Sudden death round"
        until potential_winner.any? {|pw| pw.score != potential_winner[0].score}
          potential_winner.each do |player| 
            player.cards << dealer.deal_card
            puts "Dealer has dealt #{player.name} card #{player.cards.last}"
          end
        end
      end

      players = players.sort_by {|p| -p.score }
      puts "#{potential_winner[0]} has won"
      puts "The final scores are: "
      players.each {|p| puts "Player: #{p.name}, Score: #{p.score}"}
      
      puts "Would you like to play again? enter y|n"
      play_again = gets.strip
      break unless play_again == 'y'
      puts '-' * 50
      
      players.each {|p| p.reset! }
      dealer.deck.reset!
    end 

  end
end