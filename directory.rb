@students = []   # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    # input the students
    students = input_students
  when "2"
    # show the students
    show_students
  when "3"
    confirm_save_students
  when "4"
    confirm_load_students
  when "9"
    exit
  else
    puts "Invalid selection - please try again"
  end
end

def print_menu
  puts "\n\n"
  puts "1. Add student details"
  puts "2. Show the students"
  puts "3. Save the list to a CSV"
  puts "4. Load the list from a CSV"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_student_list()
  cohorts = @students.map { |e| e[:cohort] }.uniq.sort

  index = 1
  cohorts.each do |cohort|
    @students.select{ |n| n[:cohort]==cohort}

    @students.each_with_index do |name, index|
      if name[:cohort] == cohort
        print index + 1
        print_name @students[index][:name], 70/2
        print_cohort @students[index][:cohort], 70/2
        print_country @students[index][:country]
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

def print_footer
  puts
  print "Overall, we have #{@students.length} great student#{'s' if @students.length > 1}"
end

def input_students
  puts "\n"
  puts "Please enter the student's name"
  puts "To finish, just hit return twice to any question"

  name = STDIN.gets.chomp
  while !name.empty? do
    cohort = ""
    puts "...and what cohort are they in? (default is November)"
    cohort = STDIN.gets.chomp
    cohort = "November" if cohort.empty?

    puts "Is this information correct (enter or 'y' to confirm)?"
    puts "#{name}, #{cohort}, UK"
    confirm = STDIN.gets.chomp
    if confirm.downcase == "y" || confirm.downcase == ""
      # add the student hash to the array
      add_student name, cohort
    end
    # get another name from the user
    puts
    puts "Next student:"
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_student name, cohort
    end
    file.close
    puts "Loaded #{@students.count} from #{filename}"
  end
end

def add_student(name, cohort, print_message = false)
  @students << {name: name, cohort: cohort.to_sym}
  puts "Now we have #{@students.count} student#{'s' if @students.count != 1}" if print_message
end

def confirm_save_students
  puts "Please enter the name of the save file"
  filename = gets.chomp
  if File.exists?(filename)
    puts "This file already exists.  Overwrite, append or cancel? (w / r / c)"
    loop do
      access_type = gets.chomp
      break if ['w','r','c'].include?(access_type.downcase!)
    end
  end
  access_type.sub('r', 'r+')
  save_students(filename, access_type) if access_type != 'c'
end

def confirm_load_students
  puts "please enter the name of the file to load"
  filename = gets.chomp
  if File.exists?(filename)
    load_students
  else
    puts "Unable to find that file - please try again"
  end
end

def save_students(filename, access_type = "w")
  # open the file for writing
  file = File.open(filename, access_type)
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  filename ||= "students.csv"
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
