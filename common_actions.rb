module CommonActions
  def self.included(base)
    base.extend(ClassMethods)
    base.send :include, InstanceMethods
  end

  module ClassMethods
    ;
  end

  module InstanceMethods
    attr_reader :sum, :bank

    def take_card
      raise 'You already have two cards' unless @cards.length <= 2
      @pack_of_cards ||= Deck.new
      @cards[@pack_of_cards.deck[0]] = @pack_of_cards.deck[0].value
      @pack_of_cards.deck.delete_at(0)
      sum_of_cards
    end

    def sum_of_cards
      @sum = @cards.values.inject(:+)
      @sum -= 10 if @cards.value?(11) && @sum > 21
    end

    def place_bet(rate = 10)
      @account.amount -= rate
      @bank ||= 0
      @bank += rate
    end

    def winner_gain
      @account.amount += @bank
    end

    def show_cards(block)
      @cards.each_key { |card| block.call(card) }
    end
  end
end
