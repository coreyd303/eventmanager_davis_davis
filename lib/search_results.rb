require_relative '../lib/queue.rb'

class SearchResults
  attr_reader :results

  def initialize
    @results = []
  end

  def count
    results.count
  end

  def find(attribute, value)
    @results =  @attendees.each do |entry|
      entry.select if (:attribute) == value
    end
  end

  def clear
    results.clear
  end
end

s = SearchResults.new
s.count
s.find(:first_name, "Allison")
s.count
