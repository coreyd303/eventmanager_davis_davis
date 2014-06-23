gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/data_handler'

class Data_Handler_Test < Minitest::Test

  def test_it_can_load_a_new_file_with_a_clean_a_zipcode
    Data_Handler.new
  end
end
