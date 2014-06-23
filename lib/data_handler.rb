require 'csv'

def clean_zipcode(zipcode)
  if zipcode.nil?
    "00000"
  elsif zipcode.length < 5
    zipcode.rjust(5,"0")
  elsif zipcode.length > 5
    zipcode[0..4]
  else
    zipcode
  end
end

def clean_first_name(first_Name)
  first_Name.downcase.capitalize
end

def clean_last_name(last_Name)
  last_Name.downcase.capitalize
end

# def address_builder(street, city, state)
#   puts "#{street}, #{city}, #{state}"
# end

def clean_phone_number(HomePhone)

end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

contents.each do |row|
  first_name = clean_first_name(row[:first_name])
  last_name = clean_last_name(row[:last_name])
  address = address_builder(row[:address])
  zipcode = clean_zipcode(row[:zipcode])

  puts "#{last_name}, #{first_name}, #{address}, #{zipcode}"
end
