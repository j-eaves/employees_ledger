=begin
#employee1 = ["Manila", "Campos", 80000, true]
#employee2 = ["Danilo", "Carter", 70000, false]

#Manilo makes $80000 per year
#p employee1[0] + " " +employee1[1]+ " makes $" + employee1[2].to_s + " per year"
#p "#{employee2[0]} #{employee2[1]} makes $#{employee2[2]} per year"

#hash with strings
employee1 = {
  "first_name" => "Manila",
  "last_name" => "Campos",
  "salary" => 80000,
  "active" => true
}employee1 = {
  "first_name" => "Danilo",
  "last_name" => "Carter",
  "salary" => 70000,
  "active" => false
}
p "#{employee2["first_name"]} #{employee2["last_name"]} makes $#{employee2["salary"]} per year"

#hash with symbols
# 'traditional syntax'
employee1 = {
  :first_name => "Manila",
  :last_name => "Campos",
  :salary => 80000,
  :active => true
}employee1 = {
  :first_name => "Danilo",
  :last_name => "Carter",
  :salary => 70000,
  :active => false
}

p "#{employee2[:first_name]} #{employee2[:last_name]} makes $#{employee2[:salary]} per year"
#hash with symbols
# 'JavaScript syntax' colon in front when you set it, colon in back when you use it
employee1 = {
  first_name: "Manila",
  last_name: "Campos",
  salary: 80000,
  active: true
}employee1 = {
  first_name: "Danilo",
  last_name: "Carter",
  salary: 70000,
  active: false
}


class Employee
  def initialize(input_first_name, input_last_name, input_salary, input_active)
    #assign values to the instance variables (starts with @)
    @first_name = input_first_name
    @last_name = input_last_name
    @salary = input_salary
    @active = input_active
  end
  def first_name
    #this is a getter method
    return @first_name
  end
  def last_name
    #this is a getter method
    return @last_name
  end
  def salary
    #this is a getter method
    return @salary
  end
  def active
    #this is a getter method
    return @active
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
  def active=(active_input)
    #this is a setter method
    @active = active_input
  end
end
employee1 = Employee.new("Manila", "Campos", 80000, true)
employee1 = Employee.new("Danilo", "Carter", 70000, false)
employee1.print_info
employee2.print_info
p employee1.give_annual_raise
=end

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
  def active=(active_input)
    #this is a setter method
    @active = active_input
  end
  def full_name
    full_name = @first_name+" "+@last_name
    if @last_name[-1] == "s"
      full_name = full_name + ", Esquire"
    end
    return full_name
  end
end
#What we learn:
employee1 = Employee.new({:first_name => "Manila", :last_name => "Campos", :salary => 80000, :active => true})
#Current ruby best practice
employee2 = Employee.new(first_name: "Manila", last_name: "Campos", salary: 80000, active: true)
p employee1.full_name
p employee2.full_name

