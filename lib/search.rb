require_relative '../lib/attendee_repository.rb'
require_relative '../lib/data_handler.rb'

class Search
  attr_reader :results, :attendees

  def initialize
    @results   = []
    repository = AttendeeRepository.new
    repository.build_attendees
    @attendees = repository.attendees
  end

  def count
    results.count
  end

  def find_by_first_name(first_name)
    @results << @attendees.select { |attendee| attendee.first_name == first_name}
  end

  def find_by_last_name(last_name)
    @results << @attendees.select {|attendee| attendee.last_name == last_name}
  end

  def find_by_city(city)
    @results << @attendees.select {|attendee| attendee.city == last_city}
  end

  def find_by_state(state)
    @results << @attendees.select {|attendee| attendee.state == state}
  end

  def find_by_zipcode(zipcode)
    @results << @attendees.select {|attendee| attendee.last_name == zipcode}
  end

  def clear
    @results = []
  end
end

# s = Search.new
# s.count
# s.find_by_first_name("Allison")
# s.count
