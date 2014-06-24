gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee_repository'

class AttendeeRepositoryTest < Minitest::Test
  def test_it_initializes_an_empty_array_of_attendees
    repository = AttendeeRepository.new

    assert_equal 0, repository.attendees.count
  end
end
