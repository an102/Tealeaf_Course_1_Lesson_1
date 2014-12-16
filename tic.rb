# tic.rb

def all_spaces_full
  if @user_choice_history.length == 5
    draw_board
    puts "Draw!"
    return true
  else
    return false
  end
end

def win(choice_history, potential_winner)
  @winning_positions.each do |position|
    if (choice_history & position).length == 3
      draw_board
      puts "Winner: #{potential_winner}!"
      return true
    end
  end
  return false
end

@static_parts_of_board = "         |         |\n         |         |"
@row_border = '---------+---------+---------'
@spaces = 
  { 1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ',
    6 => ' ', 7 => ' ', 8 => ' ', 9 => ' ' }
@winning_positions = 
  [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7],
   [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
@user_choice_history = []
@comp_choice_history = []
      
def draw_board
  system 'clear'
  puts @static_parts_of_board
  puts "    #{@spaces[1]}    |    #{@spaces[2]}    |    #{@spaces[3]}" 
  puts @static_parts_of_board
  puts @row_border
  puts @static_parts_of_board
  puts "    #{@spaces[4]}    |    #{@spaces[5]}    |    #{@spaces[6]}"
  puts @static_parts_of_board
  puts @row_border
  puts @static_parts_of_board
  puts "    #{@spaces[7]}    |    #{@spaces[8]}    |    #{@spaces[9]}"
  puts @static_parts_of_board
  puts ''
end

loop do
  draw_board

  begin
    puts 'Please choose a space from 1 to 9 (order runs left to right, top to bottom).'
    user_choice = gets.chomp.to_i
  end until /[1-9]/.match(user_choice.to_s) && \
    user_choice < 10 && @spaces[user_choice] == " "
  
  @spaces[user_choice] = "X"
  @user_choice_history.push(user_choice)
  
  break if win(@user_choice_history, "User")
  break if all_spaces_full
  
  begin
    comp_choice = @spaces.keys.sample
  end until @spaces[comp_choice] == " "
  
  @spaces[comp_choice] = "O"
  @comp_choice_history.push(comp_choice)
  
  break if win(@comp_choice_history, "Computer")
end
