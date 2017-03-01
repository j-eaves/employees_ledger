require "faker"
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
#generate first and last name
Faker::Name.first_name
Faker::Name.last_name