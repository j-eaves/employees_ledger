module EmailReportable #always ends in "able"
  #In the module, I can place a ton of various methods
  def send_report
    p "I will send report."
    p "Here is the report."
  end
end

#Employee class
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

#Manager class - inherited from Employee class
class Manager < Employee
  include EmailReportable
  attr_reader :employees
  def initialize(input_options)
    super
    @employees = input_options[:employees]
  end
  # def employees
    # return @employees
  # end
  def give_all_raises
    @employees.each do |employee|
      employee.give_annual_raise
    end
  end

  def fire_all_employees
    @employees.each do |employee|
      employee.active = false
    end
  end
end

#An intern can do everything that an ployee can do and can also send a report
class Intern < Employee
  include EmailReportable
end


intern1 = Intern.new(first_name: "Bob", last_name: "Earl", salary: 0, active: true)
p intern1.first_name
intern1.send_report
#What we learn:
employee1 = Employee.new({:first_name => "Manila", :last_name => "Campos", :salary => 80000, :active => true})
#Current ruby best practice
employee2 = Employee.new(first_name: "Ben", last_name: "Franklin", salary: 70000, active: true)
#p employee1.full_name
#p employee2.full_name
manager1 = Manager.new(first_name: "Jon", last_name: "Eaves", salary: 90000, active: true, employees: [employee1, employee2])
#p manager1.full_name
#p manager1.class
manager1.send_report
p manager1.employees[0].salary
manager1.give_all_raises
p manager1.employees[0].salary
p manager1.employees[0].active
manager1.fire_all_employees
p manager1.employees[0].active