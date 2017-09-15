@students = []   # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
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
  when "9"
    exit
  else
    puts "Invalid selection - please try again"
  end
end

def print_menu
  puts "\n\n"
  puts "1. Input the students"
  puts "2. Show the students"
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

  name = gets
  name = name[0...-1] if name.end_with?("\n")
  while !name.empty? do
    cohort = ""
    puts "...and what cohort are they in? (default is November)"
    cohort = gets.chomp
    cohort = "November" if cohort.empty?

    puts "Is this information correct (enter or 'y' to confirm)?"
    puts "#{name}, #{cohort}, UK"
    confirm = gets.chomp
    if confirm.downcase == "y" || ""
      # add the student hash to the array
      @students << {name: name, cohort: cohort.to_sym, country: :UK}
      puts "Now we have #{@students.count} student#{'s' if @students.count > 1}"
    end
    # get another name from the user
    puts
    puts "Next student:"
    name = gets
    name = name[0...-1] if name.end_with?("\n")
  end
  # return the array of students
  @students
end

interactive_menu
