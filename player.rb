require_relative 'common_actions'

class Player
  include CommonActions

  attr_reader :cards, :name, :account

  def initialize(name)
    @name          = name
    @cards         = {}
    @account = Bank.new(100)
  end
end
