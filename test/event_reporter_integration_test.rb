gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/data_handler'
require './lib/attendee_repository'

class Integration_Test < Minitest::Test

  def test_it_can_pass_loaded_contents_into_the_data_queue
    handler = DataHandler.new
    queue = AttendeeRepository.new
    handler.queue.data_receiver
    puts queue.new_data
  end

end
