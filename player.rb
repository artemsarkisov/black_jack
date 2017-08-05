require_relative 'deck'
require_relative 'card'
require_relative 'common_actions'
require_relative 'bank'

class Player
  include CommonActions

  attr_reader :cards, :name, :account

  def initialize(name)
    @name          = name
    @cards         = {}
    @account = Bank.new(100)
  end
end

# player = Player.new('Jimmy')
# player.take_card
# player.take_card
# player.take_card
#
# puts player.sum
#
# puts player.account.amount
