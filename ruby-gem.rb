module Jem
  class Specification
    attr_accessor :name, :version, :summary

    def initialize
      # default initialization
      @version = '1.0.0' 
      yield(self) if block_given?
    end
  end
end

spec = Jem::Specification.new do |s|
  s.name      = 'my-gem'
  s.version   = '2.0.0'
  s.summary   = 'This is a cool gem!'
end

p spec