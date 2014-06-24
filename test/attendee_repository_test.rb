gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee_repository'

class AttendeeRepository < Minitest::Test

  def setup
    @queue = Queue.new
  end

  def test_it_exists
    assert Queue
  end
  
  #not sure what to test here
end
