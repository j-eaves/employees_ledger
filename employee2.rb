
#New way of doing it
class Employee
  attr_reader :first_name, :last_name, :salary, :active #this takes the place of the getter functions below! 
  attr_writer :active 
  def initialize(input_options)
    #assign values to the instance variables (starts with @)
    @first_name = input_options[:first_name]
    @last_name = input_options[:last_name]
    @salary = input_options[:salary]
    @active = input_options[:active]
  end
  def print_info
    p "#{@first_name} #{@last_name} makes #{@salary} per year"
    #or
    p "#{first_name} #{last_name} makes #{salary} per year"
  end
  def give_annual_raise
    #change salary
    @salary = @salary * 1.05
  end
  def full_name
    full_name = @first_name+" "+@last_name
    if @last_name[-1] == "s"
      full_name = full_name + ", Esquire"
    end
    return full_name
  end
end
#----------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------
#Time for the random name generator that I found on the internet from here:
#http://www.skorks.com/2009/07/how-to-write-a-name-generator-in-ruby/
#http://www.skorks.com/wp-content/uploads/2009/07/data.txt

require 'getoptlong'
 
data_file = 'names.txt'
words_to_generate = 100
 
min_length = 3
max_length = 9
 
opts = GetoptLong.new(
  ["--datafile", "-d", GetoptLong::OPTIONAL_ARGUMENT],
  ["--number-of-words", "-n", GetoptLong::OPTIONAL_ARGUMENT]
)
 
opts.each do |opt, arg|
  case opt
  when '--datafile'
    data_file = arg
  when '--number-of-words'
    words_to_generate = arg
  end
end
 
start_pairs = []
follower_letters = Hash.new('')
 
File.open(data_file, 'r') do |file|
  chars = file.read.chomp.downcase.gsub(/\s/, ' ').chars.to_a
  chars.push(chars[0], chars[1])
  (chars.length-2).times do |i|
    if chars[i] =~ /\s/
      start_pairs.push(chars[i+1, 2].join)
    end
    follower_letters[chars[i, 2].join]=follower_letters[chars[i,2].join]+chars[i+2,1].join
  end
end
 
def generate_word(word, follower_letters, min_length)
  last_pair = word[-2, 2]
  letter = follower_letters[last_pair].slice(rand(follower_letters[last_pair].length), 1)
  if word =~ /\s$/
    return word unless word.length <= min_length
    return generate_word(word[-1, 1]+letter, follower_letters, min_length)
  else
    word = word.gsub(/^\s/, '')
    return generate_word(word+letter, follower_letters, min_length)
  end
end
=begin
 first_name = ""
 last_name = ""
words_to_generate.times do |i|
  first_name = (generate_word(start_pairs[rand start_pairs.length], follower_letters, min_length)[0, max_length].capitalize)
  last_name = generate_word(start_pairs[rand start_pairs.length], follower_letters, min_length)[0, max_length].capitalize)  
  p first_name+" "+last_name
end
=end
#----------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------
employee_array = []
count = 0
100.times do
  #Generate 100 random names and salaries
  salary = (rand(35000...78000)+1)
  first_name = ""
  last_name = ""
  first_name = (generate_word(start_pairs[rand start_pairs.length], follower_letters, min_length)[0, max_length].capitalize).strip
  last_name = (generate_word(start_pairs[rand start_pairs.length], follower_letters, min_length)[0, max_length].capitalize).strip
  employee_array << Employee.new({:first_name => first_name, :last_name => last_name, :salary => salary, :active => true})
  #p employee_array[count].full_name + " Salary: $" + salary.to_s
  p "#{first_name} #{last_name} makes $#{salary} per year"
  #p employee_array[count].full_name
  count += 1
end