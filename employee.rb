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
# 'new syntax' colon in front when you set it, colon in back when you use it
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