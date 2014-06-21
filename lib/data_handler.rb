require 'csv'
require_relative 'data_queue'

class Data_Handler

  attr_reader :contents

  def initialize
    puts 'Your data has been loaded'
    @contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
  end

  def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end



end
