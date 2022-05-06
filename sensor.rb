class Sensor
  def temperature
    rand(100..200)
  end

  def level
    rand(1..5)
  end

  def check(label)
    puts "Checking #{label}..."
    result = yield
    if result
      puts 'OK'
    else
      puts 'FAILED!'
    end
  end
end

sensor = Sensor.new

sensor.check('temperature') {  sensor.temperature < 150 }

sensor.check('water level') {  sensor.level > 3 }