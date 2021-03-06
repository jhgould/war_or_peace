# turn class
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'


class Turn

  attr_reader :player1, :player2
  attr_accessor :spoils_of_war

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @spoils_of_war = []


  end



  def type
    # require 'pry'; binding.pry
    if @player1.deck.rank_of_card_at(0) == @player2.deck.rank_of_card_at(0) && @player1.deck.rank_of_card_at(2)== @player2.deck.rank_of_card_at(2)
        type = :mutually_assured_destruction
    elsif @player1.deck.cards[0].rank == @player2.deck.cards[0].rank
      type = :war
    else @player1.deck.cards[0].rank != @player2.deck.cards[0].rank
      type = :basic
    end
   end

   def winner
     if type == :basic
            if @player1.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                round_winner = @player1
            else @player2.deck.rank_of_card_at(0) > @player2.deck.rank_of_card_at(0)
                round_winner = @player2
            end

      elsif type == :war
           if @player1.deck.rank_of_card_at(2) > @player2.deck.rank_of_card_at(2)
            round_winner = @player1
          else @player2.deck.cards[2].rank > @player2.deck.rank_of_card_at(2)
            round_winner = @player2
           end

      elsif type == :mutually_assured_destruction
            round_winner = "No Winner"

      end
    end

    def pile_cards


      if type == :basic
      @spoils_of_war << @player1.deck.cards[0]
      @spoils_of_war << @player2.deck.cards[0]
      # @player1.deck.cards.shift
      # @player2.deck.cards.shift
      # require 'pry'; binding.pry



      elsif type == :war
      @spoils_of_war << @player1.deck.cards[0..2]
      @spoils_of_war << @player2.deck.cards[0..2]
      @spoils_of_war.flatten


      elsif type == :mutually_assured_destruction
        @spoils_of_war << @player1.deck.cards[0..2]
        @spoils_of_war << @player2.deck.cards[0..2]
        @spoils_of_war.clear
      end
      # require 'pry'; binding.pry

    end

    def award_spoils(winner)
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten.uniq
      # require 'pry'; binding.pry
    end

  end
