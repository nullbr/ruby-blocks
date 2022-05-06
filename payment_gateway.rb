class PaymentGateway
  def initialize(user, password)
    @user = user
    @password = password
  end

  def connect
    # connects to remote service
    puts "Connected as #{@user}."
  end

  def disconnect
    # disconnect from remote service
    puts "Disconnected #{@user}!"
  end

  def submit(type, amount)
    # submits request to remote service
    puts "Submited #{type} for #{amount}"
  end

  def self.open(user, password)
    gateway = self.new(user, password)
    gateway.connect
    return gateway unless block_given?
    begin
      yield(gateway)
    rescue Exception => e
      puts e.message
    ensure
      gateway.disconnect
    end
  end
end

gateway = PaymentGateway.open('nicole', 'secret')
gateway.submit(:void, 15.00)
gateway.disconnect

PaymentGateway.open('nicole', 'secret') do |g|
  g.submit(:sale, 12.00)
  g.submit(:sale, 10.00)
end

PaymentGateway.open('nicole', 'secret') do |g|
  g.submit(:refund, 12.00)
  g.submit(:refund, 10.00)
  raise "Problema!!"
end