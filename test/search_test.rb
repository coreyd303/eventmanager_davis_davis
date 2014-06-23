require 'pry'
gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/search.rb'

class SearchTest < Minitest::Test
  attr_reader :search

  def setup
    @search = Search.new
  end

  def test_it_exists
    assert Search
  end

  def test_results_is_empty_at_start
    assert 0, search.count
  end

  def test_it_can_add_a_result
    result = @search.find_by_first_name("allison")

    assert_equal 1, result.count
  end

  def test_it_can_add_another_result
    search = Search.new
    result = search.find_by_first_name("john")
    result = search.find_by_first_name("allison")
    assert_equal 2, result.count
  end

  


end
