# calculator.rb

require "bigdecimal"
require "bigdecimal/util"

def checker(num)
  arr = []
  
  num.to_s.each_char do |char|
    arr.push(char)
  end
  
  if arr[arr.length - 2] == "." && arr[arr.length - 1] == "0"
    puts "The result is #{num.to_i}"
  else
    puts "The result is #{num}"
  end
end

loop do
  num1 = ""
  num2 = ""
  
  loop do 
    puts "Please enter the first number"
    
    num = gets.chomp
    num1 = num.to_d
    
    break if num == num1.to_f.to_s || num == num.to_i.to_s
    
    print "Invalid input. "
  end
  
  loop do
    puts "Please enter the second number"
    
    num = gets.chomp
    num2 = num.to_d
    
    break if num == num2.to_f.to_s || num == num2.to_i.to_s
  
    print "Invalid input. "
  end
  
  loop do
    puts "Please choose the desired operation"
    puts "1 = Add   2 = Subtract   3 = Multiply   4 = Divide"

    option = gets.to_i
 
    if option == 1
      checker((num1 + num2).to_f)
    elsif option == 2
      checker((num1 - num2).to_f)
    elsif option == 3
      checker((num1 * num2).to_f)
    elsif option == 4
      checker((num1 / num2).to_f)
    else
      print "Invalid input. "
    end

    break if [1, 2, 3, 4].include?(option)
  end

  puts "Input 'e' to exit. Otherwise, perform new calculation"

  resp = gets.chomp

  break if ["e", "exit"].include?(resp.downcase)
end
