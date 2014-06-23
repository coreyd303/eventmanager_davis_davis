require 'csv'
require_relative '../lib/data_handler.rb'


class Attendee
  #attr_reader :handler, :first_name, :last_name, :phone, :city, :state  # => nil

  def initialize(row)
    handler     = DataHandler.new
    first_name  = handler.clean_first_name(row[:first_name])
    last_name   = handler.clean_last_name(row[:last_name])
    phone       = handler.clean_phone_number(row[:homephone])
    city        = handler.clean_city(row[:city])
    state       = handler.clean_state(row[:state])
  end
end
