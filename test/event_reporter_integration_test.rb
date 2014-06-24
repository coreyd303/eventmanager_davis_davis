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

  def test_it_initializes_an_empty_results_repository
    event_reporter = EventReporter.new

    assert 0, results.count
  end

  def test_it_loads_a_csv_document

  end
  
  # def test_it_can_pass_loaded_contents_into_the_data_queue
  #   handler = DataHandler.new
  #   queue = AttendeeRepository.new
  #   handler.queue.data_receiver
  #   puts queue.new_data
  # end

end
