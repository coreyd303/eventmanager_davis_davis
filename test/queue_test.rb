gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/queue.rb'

class QueueTest < Minitest::Test

  def setup
    @queue = Queue.new
  end

  def test_it_exists
    assert Queue
  end

  def test_I_cant_write_tests
    assert 
  end
end
