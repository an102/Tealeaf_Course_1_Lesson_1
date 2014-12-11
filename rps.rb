# rps.ruby

def shoot(user, comp)
  puts "\nYou: #{user.upcase}\nComputer: #{comp.upcase}\n"
end

def declare_user_loser(user, comp)
  puts "#{comp.capitalize} beats #{user}! You lose!! Loser!!"
end

def declare_user_winner(user, comp)
  puts "Well hot dog! We have a wiener! #{user.capitalize} beats #{comp}!"
end
  
def declare_draw
  puts "\nIt's a draw! Think fast!"
end

CHOICES = ['rock', 'paper', 'scissors']

puts "\nRock, paper, scissors time! Let's get down to business, shall we?"

loop do

  user_choice = ''
  comupter_choice = ''
  puts ''
  
  loop do
    puts "Choose your weapon!\nr = rock    p = paper    s = scissors"
    user_choice = gets.chomp.downcase
    comupter_choice = CHOICES.sample
    break if ['rock', 'paper', 'scissors', 'r', 'p', 's'].include?(user_choice)
    print "\nLet's try again. " 
  end
  
  puts "\nRock, paper, scissors, SHOOT!"

  case user_choice 
  when 'r' || 'rock'
    user_choice = 'rock'
  when 's' || 'scissors'
    user_choice = 'scissors'
  else
    user_choice = 'paper'
  end
  
  if (user_choice == 'rock' && comupter_choice == 'paper') ||
     (user_choice == 'scissors' && comupter_choice == 'rock') ||
     (user_choice == 'paper' && comupter_choice == 'scissors')
    shoot(user_choice, comupter_choice)
    declare_user_loser(user_choice, comupter_choice)
  elsif (user_choice == 'rock' && comupter_choice == 'scissors') ||
        (user_choice == 'scissors' && comupter_choice == 'paper') ||
        (user_choice == 'paper' && comupter_choice == 'rock')
    shoot(user_choice, comupter_choice)
    declare_user_winner(user_choice, comupter_choice)
  else
    shoot(user_choice, comupter_choice)
    declare_draw
  end
  
  new_game = ''
  
  if user_choice != comupter_choice
    begin 
      puts "\nGo again? (Y/N)"
      new_game = gets.chomp.downcase
    end until ['y', 'yes', 'n', 'no'].include?(new_game)  
  end
  break if ['n', 'no'].include?(new_game)
end

puts "\nGood day, sir!"