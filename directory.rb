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

def print_student_details(names)
  index = 0
  while index < names.count
      print_index index
      print_name names[index][:name], 80
      print_cohort names[index][:cohort], 80
      print_country names[index][:country]
      print "\n"

      index += 1
  end
end

def print_index(index)
  print index + 1
end

def print_name(name, line_width)
  print name.center(line_width/3)
end

def print_cohort(cohort, line_width)
  print "(#{cohort} cohort)".rjust(line_width/3)
end

def print_country(country)
  print country
end

def print_footer(names)
  puts
  print "Overall, we have #{names.length} great students"
end

def input_students
  puts "Please enter the student's name"
  puts "To finish, just hit return twice to any question"

  students = []
  name = gets.chomp
  while !name.empty? do
    cohort = ""
    puts "...and what cohort are they in? (default is November)"
    cohort = gets.chomp
    cohort = "November" if cohort.empty?

    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, country: :UK}
    puts "Now we have #{students.count} student#{'s' if students.count > 0}"
    # get another name from the user
    puts
    puts "Next student:"
    name = gets.chomp
  end
  # return the array of students
  students
end

students = input_students
print_header
print_student_details(students)
print_footer(students)
