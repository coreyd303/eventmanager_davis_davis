gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/search_results.rb'

class SearchResultsTest < Minitest::Test
  attr_reader :search_results

  def setup
    @search_results = SearchResults.new
  end

  def test_it_exists
    assert SearchResults
  end

  def test_it_has_no_results_to_start_with
    assert_equal 0, search_results.count
  end

  def test_it_has_search_results_after_a_search
    

    assert_equal 1, search_results.count
  end
end
