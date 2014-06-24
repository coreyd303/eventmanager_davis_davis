require 'csv'
require './lib/data_handler'


class Attendee
  attr_reader :handler,
              :first_name,
              :last_name,
              :phone,
              :city,
              :state,
              :zipcode

  def initialize(row)
    @handler     = DataHandler.new
    @first_name  = handler.clean_first_name(row[:first_name])
    @last_name   = handler.clean_last_name(row[:last_name])
    @phone       = handler.clean_phone_number(row[:homephone])
    @city        = handler.clean_city(row[:city])
    @state       = handler.clean_state(row[:state])
    @zipcode     = handler.clean_zipcode(row[:zipcode])
  end
  
end
