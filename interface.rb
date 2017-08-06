require_relative 'dealer'
require_relative 'player'
require_relative 'deck'
require_relative 'common_actions'
require_relative 'card'
require_relative 'bank'

class Interface
  include CommonActions

  @@player_options = ['1 - Pass', '2 - Take one more card', '3 - Show cards',
                      '4 - Play again', '5 - Exit']

  def initialize
    puts 'Enter your name'
    name    = gets.chomp
    @player = Player.new(name.capitalize)
    @dealer = Dealer.new
    @block  = proc { |card| card.card_info }
  end

  def start_game
    2.times do
      @player.take_card
      @dealer.take_card
    end
    @player.place_bet
    @dealer.place_bet
    puts '--All bets are off.--'
    puts see_cards_and_sum
    player_choice
  end

  def start_again
    @player.cards.clear
    @dealer.cards.clear
    @pack_of_cards = Deck.new
    start_game
  end

  private

  def see_cards_and_sum
    puts "#{@player.name}, your cards are:"
    @player.show_cards @block
    puts "Sum of cards: #{@player.sum}"
    puts "Bank: $#{@player.account.amount}"
  end

  def player_choice
    raise 'Game over!' if @player.account.amount.zero? || @dealer.account.amount.zero?
    puts 'Enter your choice:'
    @@player_options.each { |option| puts option.to_s }
    @choice = gets.chomp.to_i
    player_actions
  rescue => e
    puts e.message
    exit
  end

  def player_actions
    case @choice
    when 1
      @@player_options.delete_at(0)
      dealer_actions
    when 2
      @player.take_card
      dealer_actions
    when 3
      game_result
    when 4
      start_again
    when 5
      exit
    else
      puts 'Unknown action'
      player_choice
    end
  end

  def dealer_actions
    if @dealer.sum >= 18
      puts 'Dealer passed.'
    else
      @dealer.take_card
      puts 'Dealer took one more card.'
    end
    supp_condition
  end

  def supp_condition
    if @player.cards.length == 2
      player_choice
    else
      game_result
    end
  end

  def game_result
    puts "#{@player.name}'s cards:"
    @player.show_cards @block
    puts 'Dealer\'s cards:'
    @dealer.show_cards @block
    puts "#{@player.name}'s score: #{@player.sum} | Dealer's score: #{@dealer.sum}"
    result_logic
    player_choice
  end

  def result_logic
    if @player.sum <= 21 && @player.sum > @dealer.sum || @player.sum <= 21 && @dealer.sum > 21
      puts "#{@player.name} wins!"
      @player.winner_gain
      @player.account.amount
      @player.name
    elsif @dealer.sum <= 21 && @dealer.sum > @player.sum || @dealer.sum <= 21 && @player.sum > 21
      puts 'Dealer wins!'
      @dealer.winner_gain
    else
      puts 'Draw!'
      clear_bank
    end
  end
end

game = Interface.new
game.start_game

