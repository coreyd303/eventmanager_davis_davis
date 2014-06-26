gem 'minitest', '~>5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './test_helper'

class Integration_Test < Minitest::Test

  def test_it_exists
    CLI.new
  end


end
