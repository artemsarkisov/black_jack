require_relative 'common_actions'

class Dealer
  include CommonActions

  attr_reader :cards, :account

  def initialize
    @cards   = {}
    @account = Bank.new(100)
  end
end
