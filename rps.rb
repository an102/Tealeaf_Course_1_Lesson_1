# rps.ruby

def shoot(user, comp)
  puts "\nYou: #{user.upcase}\nComputer: #{comp.upcase}"
end

def declare_user_loser(user, comp)
  shoot(user, comp)
  puts "\n#{comp.capitalize} beats #{user}! You lose!! Loser!!"
end

def declare_user_winner(user, comp)
  shoot(user, comp)
  puts "\nWell hot dog! We have a wiener! #{user.capitalize} beats #{comp}!"
end
  
def declare_draw(user, comp)
  shoot(user, comp)
  puts "\nIt's a draw! Think fast!"
end

CHOICES = ['rock', 'paper', 'scissors']

puts "\nRock, paper, scissors time! Let's get down to business, shall we?"

loop do

  user_choice = ''
  computer_choice = ''
  puts ''
  
  loop do
    puts "Choose your weapon!\nr = rock    p = paper    s = scissors"
    user_choice = gets.chomp.downcase
    computer_choice = CHOICES.sample
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
  
  draw_not_detected = true
  
  if (user_choice == 'rock' && computer_choice == 'paper') ||
     (user_choice == 'scissors' && computer_choice == 'rock') ||
     (user_choice == 'paper' && computer_choice == 'scissors')
    declare_user_loser(user_choice, computer_choice)
  elsif (user_choice == 'rock' && computer_choice == 'scissors') ||
        (user_choice == 'scissors' && computer_choice == 'paper') ||
        (user_choice == 'paper' && computer_choice == 'rock')
    declare_user_winner(user_choice, computer_choice)
  else
    declare_draw(user_choice, computer_choice)
    draw_not_detected = false
  end
  
  new_game = ''
  
  if draw_not_detected
    begin 
      puts "\nGo again? (Y/N)"
      new_game = gets.chomp.downcase
    end until ['y', 'yes', 'n', 'no'].include?(new_game)  
  end
  break if ['n', 'no'].include?(new_game)
end

puts "\nGood day, sir!"