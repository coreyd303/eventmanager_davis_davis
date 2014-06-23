gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/data_handler'

class DataHandlerTest < Minitest::Test
  attr_reader :data_handler

  def setup
    @data_handler = DataHandler.new
  end

  def test_it_exists
    assert DataHandler
  end

  def test_it_does_nothing_to_a_good_zipcode
    assert_equal "80202", data_handler.clean_zipcode("80202")
  end

  def test_a_nil_zipcode_returns_zeroes
    assert_equal "00000", data_handler.clean_zipcode(nil)
  end

  def test_a_short_zipcode_gets_padded_with_zeroes
    assert_equal "00123", data_handler.clean_zipcode("123")
  end

  def test_a_long_zipcode_returns_zeroes
    assert_equal "00000", data_handler.clean_zipcode("123456")
  end

  def test_a_simple_first_name_is_lowercased
    assert_equal "jeff", data_handler.clean_first_name("Jeff")
  end

  def test_a_mixed_case_first_name_is_lowered
    assert_equal "jeff", data_handler.clean_first_name("JeFF")
  end

  def test_a_multiname_first_name_is_lowered
    assert_equal "john paul", data_handler.clean_first_name("John Paul")
  end

  def test_a_multiname_last_name_is_lowered
    assert_equal "raven hanssen", data_handler.clean_last_name("Raven Hanssen")
  end

  def test_a_good_phone_number_is_not_changed
    assert_equal "5712223333", data_handler.clean_phone_number("5712223333")
  end

  def test_hyphens_are_removed_from_a_phone_number
    assert_equal "1234567890", data_handler.clean_phone_number("123-456-7890")
  end

  def test_periods_are_removed_from_a_phone_number
    assert_equal "1234567890", data_handler.clean_phone_number("123.456.7890")
  end

  def test_non_digits_are_removed_from_a_phone_number
    assert_equal "1234567890", data_handler.clean_phone_number("(123) 456-7890")
  end

  def test_non_digits_are_removed_from_a_phone_number
    assert_equal "98200", data_handler.clean_phone_number("9.82E+00")
  end
  
  def test_a_good_city_is_not_changed
    assert_equal "denver", data_handler.clean_city("denver")
  end

  def test_a_mixed_case_city_is_lowered
    assert_equal "pheonix", data_handler.clean_city("PheoNIx")
  end

  def test_a_multi_word_city_name_is_lowered
    assert_equal "colorado springs", data_handler.clean_city("Colorado Springs")
  end

  def test_a_down_case_state_is_up_cased
    assert_equal "AZ", data_handler.clean_state("az")
  end

  def test_a_mixed_case_state_is_up_cased
    assert_equal "CO", data_handler.clean_state("Co")
  end

end
