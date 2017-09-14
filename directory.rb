students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Bratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_names(names, starts_with = "", short_than = 999)
  names.each_with_index do |name, index|
      puts "#{index + 1} #{name[:name]} (#{name[:cohort]} cohort)" if name[:name].start_with?(starts_with) && name[:name].length < short_than
  end
end

def print_footer(names)
  print "Overall, we have #{names.length} great students"
end

def input_students
  puts "Please enter tha names of the students"
  puts "To finish, just hit return twice"

  students = []
  name = gets.chomp
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

#students = input_students
print_header
print_names(students, "T", 11)
print_footer(students)
