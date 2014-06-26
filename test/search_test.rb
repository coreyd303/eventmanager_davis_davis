require 'csv'
gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'

class SearchTest < Minitest::Test
  attr_reader :search, :results

  def setup
    @search = Search.new("./test/fixtures/sample_data.csv")
  end

  def test_results_is_empty_at_start
    assert 0, search.results.count
  end

  def test_it_can_search_by_first_name
    results = search.find_by_first_name("allison")

    assert_equal 1, search.results.count
  end

  def test_it_can_find_multiples_of_a_first_name
    results = search.find_by_first_name("shannon")
    assert_equal 2, search.results.count
  end

  def test_it_can_search_by_last_name
    results = search.find_by_last_name("zielke")
    assert_equal 1, search.results.count
  end

  def test_it_can_find_multiples_of_a_last_name
    results = search.find_by_last_name("warner")
    assert_equal 4, search.results.count
  end

  def test_it_can_search_by_city
    results = search.find_by_city("nashville")
    assert_equal 1, search.results.count
  end

  def test_it_can_find_multiples_of_cities
    results = search.find_by_city("lyndeborough")
    assert_equal 4, search.results.count
  end

  def test_it_can_search_by_state
    results = search.find_by_state("PR")
    assert_equal 1, search.results.count
  end

  def test_it_can_find_multiples_of_states
    results = search.find_by_state("NH")
    assert_equal 4, search.results.count
  end

  def test_it_can_search_by_zipcode
    results = search.find_by_zipcode("21230")
    assert_equal 1, search.results.count
  end

  def test_it_can_find_multiples_of_zipcodes
    results = search.find_by_zipcode("03082")
    assert_equal 4, search.results.count
  end

  def test_results_can_be_cleared
    results = search.find_by_zipcode("03082")
    assert_equal 4, search.results.count

    search.results.clear
    assert_equal 0, search.results.count
  end
end
