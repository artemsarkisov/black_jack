require_relative 'common_actions'

class Bank

  include CommonActions

  attr_accessor :amount

  def initialize(amount)
    @amount = amount
  end
end


# bank = Bank.new(100)
#
# puts bank.amount