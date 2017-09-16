def show_source_code
  puts "This is a simple method that is designed"
  puts "to output the code from this proc to the screen"

  source_file = File.open($0, "r")
  puts "\n\nThis is the source code from this file:#{source_file}"
  source_file.readlines.each do |line|
    puts line
  end
end

def a_dummy_proc
  # A dummy proc so that we have something
  # other than the first proc on the screen
end

show_source_code
