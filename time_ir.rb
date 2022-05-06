def time_it(label)
  start_time = Time.now
  yield
  elapsed_time = Time.now - start_time
  puts "#{label.capitalize} took #{elapsed_time} seconds"
end

time_it("Sleepy doce") do
  # run some code
  sleep(0.5)
end
