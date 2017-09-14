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

def print_names(names, starts_with = "", shorter_than = 999)
  # names.each_with_index do |name, index|
  #     puts "#{index + 1} #{name[:name]} (#{name[:cohort]} cohort)" if name[:name].start_with?(starts_with) && name[:name].length < short_than
  # end
  index = 0
  while index < names.count
      puts "#{index + 1} #{names[index][:name]} (#{names[index][:cohort]} cohort)" \
          "#{names[index][:country]}" \
            if names[index][:name].start_with?(starts_with) \
              && names[index][:name].length < shorter_than
      index += 1
  end
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
    puts "...and what cohort are they in?"
    cohort = gets.chomp
    break if cohort.empty?

    # add the student hash to the array
    students << {name: name, cohort: cohort.to_sym, country: :UK}
    puts "Now we have #{students.count} student#{'s' if students.count}"
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
print_names(students)
print_footer(students)
