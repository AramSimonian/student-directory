students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :january},
  {name: "Nurse Ratched", cohort: :march},
  {name: "Michael Corleone", cohort: :january},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :january},
  {name: "Terminator", cohort: :march},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :march},
  {name: "Joffrey Bratheon", cohort: :january},
  {name: "Norman Bates", cohort: :november}
]

def interactive_menu
  students = []
  loop do
    # 1 print the menu and ask the user what to do
    puts "\n\n"
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    # 2 read the input and save it into a variable
    selection = gets.chomp

    # 3 execute the action
    case selection
    when "1"
      # input the students
      students = input_students
    when "2"
      # show the students
      print_header
      print_student_details(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "Invalid selection - please try again"
    end


  end
end


def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_student_details(names)
  cohorts = names.map { |e| e[:cohort] }.uniq.sort

  index = 1
  cohorts.each do |cohort|
    names.select{ |n| n[:cohort]==cohort}

    names.each_with_index do |name, index|
      if name[:cohort] == cohort
        print index + 1
        print_name names[index][:name], 70/2
        print_cohort names[index][:cohort], 70/2
        print_country names[index][:country]
        print "\n"      end
    end
  end
end

def print_name(name, line_width)
  print name.center(line_width)
end

def print_cohort(cohort, line_width)
  print "(#{cohort} cohort)".rjust(line_width)
end

def print_country(country)
  print country
end

def print_footer(names)
  puts
  print "Overall, we have #{names.length} great student#{'s' if names.length > 1}"
end

def input_students
  puts "\n"
  puts "Please enter the student's name"
  puts "To finish, just hit return twice to any question"

  students = []
  name = gets
  name = name[0...-1] if name.end_with?("\n")
  while !name.empty? do
    cohort = ""
    puts "...and what cohort are they in? (default is November)"
    cohort = gets.chomp
    cohort = "November" if cohort.empty?

    puts "Is this information correct (y/n)?"
    puts "#{name}, #{cohort}, UK"
    confirm = gets.chomp
    if confirm.downcase == "y"
      # add the student hash to the array
      students << {name: name, cohort: cohort.to_sym, country: :UK}
      puts "Now we have #{students.count} student#{'s' if students.count > 1}"
    end
    # get another name from the user
    puts
    puts "Next student:"
    name = gets
    name = name[0...-1] if name.end_with?("\n")
  end
  # return the array of students
  students
end

interactive_menu
