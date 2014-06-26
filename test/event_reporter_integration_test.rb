gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'

class EventReporterIntegrationTest < Minitest::Test

  def test_it_exists
    event_reporter = EventReporter.new

    assert EventReporter
  end


end
