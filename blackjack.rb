# blackjack.rb

def welcome
  system 'clear'
  puts "Welcome to Tealeaf Blackjack! What's your name, friend?\n "
  @player_name = gets.chomp.capitalize
  @player_name = 'THRILLHO' if !/^\w/.match(@player_name)
  sleep(0.3)
  puts "\nAlright, #{@player_name}! Let's get started!\n "
  sleep(1.2)
end

def deal_card(hand, holder)
  dealt_card = @deck.keys.sample
  hand[dealt_card] = @deck.values_at(dealt_card)[0]
  pretotal = 0
  hand.values.each { |value| pretotal += value }
  hand['A'] = 1 if hand.has_key?('A') && pretotal > 21
  total = 0
  hand.values.each { |value| total += value }
  if holder == 'Dealer'
    @dealer_score = total
  else
    @player_score = total
  end
  @deck.delete(dealt_card)
end

def display_one_hand(hand, holder)
  print "#{holder}'s hand: "
  hand.keys.each do |card|
    sleep(1) unless @already_printed.include?(card) || (@player_score > 21 && holder == 'Dealer')
    print card + "  "
    @already_printed.push(card) unless @already_printed.include?(card)
  end
  if holder == 'Dealer'
    score = @dealer_score
  else
    score = @player_score
  end
  sleep(0.7) unless (@player_score > 21 && holder == 'Dealer') || ['s', 'stay'].include?(@play_option)
  puts "\nScore: #{score}\n "
  sleep(0.7) unless (@player_score > 21 && holder == 'Dealer') || ['s', 'stay'].include?(@play_option)
end

def display_both_hands
  system 'clear'
  puts ''
  display_one_hand(@player_hand, @player_name)
  display_one_hand(@dealer_hand, 'Dealer')
end

def player_blackjack
  return false unless @player_score == 21 && @player_hand.keys.count == 2
  return true
end

welcome

@deck = {}
@player_hand = {}
@dealer_hand = {}
@already_printed = []
@player_score = 0
@dealer_score = 0

['♠', '♥', '♦', '♣'].each do |symbol|
  (2..10).each do |number|
    card = number.to_s + symbol
    @deck[card] = number
  end
  ['J', 'Q', 'K'].each do |letter|
    card = letter + symbol
    @deck[card] = 10
  end
  @deck['A' + symbol] = 11
end

deal_card(@player_hand, @player_name)
deal_card(@dealer_hand, 'Dealer')
deal_card(@player_hand, @player_name)

while @player_score < 21
  display_both_hands
  begin
    puts "Hit or stay?"
    @play_option = gets.chomp.downcase
  end until ['h', 's', 'hit', 'stay'].include?(@play_option)
  if ['h', 'hit'].include?(@play_option)
    deal_card(@player_hand, @player_name)
  else
    break
  end
  break if @player_score >= 21
end

while @dealer_score < 17 && @player_score <= 21
  deal_card(@dealer_hand, 'Dealer')
  break if player_blackjack
end

display_both_hands

if @player_score > 21
  puts "#{@player_name} is bust!\n \nDealer wins!"
elsif @dealer_score > 21
  puts "Dealer bust!\n \n#{@player_name} wins!"
elsif player_blackjack && @dealer_score == 21 && @dealer_hand.keys.count == 2
  puts "Double blackjack!\n \nPush!"
elsif player_blackjack
  puts "Blackjack!\n \n#{@player_name} wins!"
elsif @dealer_score == 21 && @dealer_hand.keys.count == 2
  puts "Dealer blackjack!\n \nDealer wins!"
elsif @dealer_score == @player_score
  puts 'Push!'
elsif @dealer_score > @player_score
  puts "Dealer wins!"
else
  puts "#{@player_name} wins!"
end
