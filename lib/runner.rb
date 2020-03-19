require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'


card1 = Card.new(:diamond, 'Queen', 12)
card2 = Card.new(:spade, '3', 3)
card3 = Card.new(:heart, 'Ace', 14)
cards = cards = [card1, card2, card3]

deck = Deck.new(cards)
deck.cards
deck.rank_of_card_at(0)
deck.rank_of_card_at(2)
deck.cards
deck.high_ranking_cards
deck.percent_high_ranking
# deck.remove_card
deck.cards
deck.high_ranking_cards
deck.percent_high_ranking
card4 = Card.new(:club, '5', 5)
deck.add_card(card4)
deck.cards
deck.high_ranking_cards
deck.percent_high_ranking

player1 = Player.new("Jack", deck)
player1.has_lost?
# require 'pry'; binding.pry