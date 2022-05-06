f = File.open('letter.txt', 'w')
f.puts "Hello!"
f.puts "Goodbye."
f.close

f = File.open('letter.txt', 'r')
f.each { |line| puts line }
f.close

# Same thing, but the block takes care of closing the file
File.open('letter.txt', 'w') do |f|
  f.puts "Hello!"
  f.puts "Goodbye."
end

File.open('letter.txt', 'r') do |f|
  f.each { |line| puts line }
end

puts '###'
# Creating my own file class to do the same thing from above
class File
  def self.my_open(filename, mode)
    file = File.new(filename, mode)
    
    return file unless block_given?
    
    begin
      yield(file)
    ensure
      file.close
    end
  end
end

File.my_open('letter.txt', 'w') do |f|
  f.puts "Hello!"
  f.puts "Goodbye."
end

File.my_open('letter.txt', 'r') do |f|
  f.each { |line| puts line }
end