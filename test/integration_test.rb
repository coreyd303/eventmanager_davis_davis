gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'

class Integration_Test < Minitest::Test

  def test_it_exists
    CLI.new
  end

  def test_when_it_starts_it_has_an_empty_queue
    cli = CLI.new
    assert_equal 0, cli.queue.count
  end

  def test_it_can_output_help_text
    cli = CLI.new
    assert_equal "Output how many records are in the current queue.", cli.run("queue", "count")
  end

end
