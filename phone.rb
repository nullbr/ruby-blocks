class Phone
  attr_accessor :airplane_mode

  def initialize
    @airplane_mode = false
  end

  def text(message)
    if @airplane_mode
      puts "Saved text: #{message}"
    else
      puts "Sent text: #{message}"
    end
  end

  def in_airplane_mode
    @airplane_mode = true
    yield
  # if an error raised, make sure it does not ripple to the rest of the code
  rescue Exception => e
    puts e.message
  # if rescue is called, make sure this line is loaded regardless
  ensure
    @airplane_mode = false
  end
end

phone = Phone.new

phone.in_airplane_mode do
  phone.text('just took off!')
  phone.text('At 30,000 ft!')
  # simulate an error
  raise 'Whoops!'
end

puts phone.text('Just landed')
