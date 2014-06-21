gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/data_handler'

class Data_Handler_Test < Minitest::Test

  def test_it_can_load_a_CSV
    handler = Data_Handler.new
    puts handler.contents
  end

  def test_it_can_clean_a_zipcode
    handler = Data_Handler.new
    

  end
end
