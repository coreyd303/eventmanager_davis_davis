gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/data_handler'
require_relative '../lib/data_queue'

class Integratin_Test < Minitest::Test

  def test_it_can_pass_loaded_contents_into_the_data_queue
    handler = Data_Handler.new
    queue = Data_Queue.new
    handler.queue.data_receiver
    puts queue.new_data
  end

end
