gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/event_reporter'
# require './lib/data_handler'
# require './lib/attendee_repository'

class EventReporterIntegrationTest < Minitest::Test

  def test_it_exists
    event_reporter = EventReporter.new

    assert EventReporter
  end


end
