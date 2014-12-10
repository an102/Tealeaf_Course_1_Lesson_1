# rps.ruby

def shoot(user, comp)
  puts "\nYou: #{user.upcase}\nComputer: #{comp.upcase}\n"
end

def loser(user, comp)
  puts "#{comp.capitalize} beats #{user}! You lose!! Loser!!"
end

def winner(user, comp)
  puts "Well hot dog! We have a wiener! #{user.capitalize} beats #{comp}!"
end
  
def draw
puts "\nIt's a draw! Think fast!"
end

SELECTION = ['rock', 'paper', 'scissors']

puts "\nRock, paper, scissors time! Let's get down to business, shall we?"

loop do
  user = ''
  comp = ''
  
  puts ''
  
  begin
    puts 'Choose your weapon!'
    puts 'r = rock    p = paper    s = scissors'
    
    user = gets.chomp.downcase
    comp = SELECTION.sample
    
    if !['rock', 'paper', 'scissors', 'r', 'p', 's'].include?(user)
      print "\nLet's try again. "
    end
  end until ['rock', 'paper', 'scissors', 'r', 'p', 's'].include?(user)
  
  puts "\nRock, paper, scissors, SHOOT!"

  case user 
  when 'r' || 'rock'
    user = 'rock'
  when 's' || 'scissors'
    user = 'scissors'
  else
    user = 'paper'
  end
  
  if (user == 'rock' && comp == 'paper') || (user == 'scissors' && comp == 'rock') ||
     (user == 'paper' && comp == 'scissors')
    shoot(user, comp)
    loser(user, comp)
  elsif (user == 'rock' && comp == 'scissors') || (user == 'scissors' && comp == 'paper') ||
        (user == 'paper' && comp == 'rock')
    shoot(user, comp)
    winner(user, comp)
  else
    draw
  end

  new = ''
  
  if user != comp
    begin 
      puts "\nGo again? (Y/N)"
      
      new = gets.chomp.downcase
      
      if ['n', 'no'].include?(new)
        puts "\nGood day, sir!"
      end
    end until ['y', 'yes', 'n', 'no'].include?(new)  
  end
  
  break if ['n', 'no'].include?(new)
end