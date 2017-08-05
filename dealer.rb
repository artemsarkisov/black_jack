require_relative 'common_actions'
require_relative 'deck'
require_relative 'card'
require_relative 'bank'

class Dealer
  include CommonActions

  attr_reader :cards, :account

  def initialize
    @cards   = {}
    @account = Bank.new(100)
  end
end

# dealer = Dealer.new
# dealer.take_card
# dealer.take_card
# dealer.take_card
# puts dealer.sum_of_cards
#
# puts dealer.account.amount
