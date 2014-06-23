require 'csv'

class DataHandler

  def clean_zipcode(zipcode)
    if zipcode.nil? || zipcode.length > 5
      "00000"
    elsif zipcode.length < 5
      zipcode.rjust(5, "0")
    else
      zipcode
    end
  end

  def clean_first_name(first_name)
    first_name.downcase
  end

  def clean_last_name(last_name)
    last_name.downcase
  end

  def clean_phone_number(homephone)
    if homephone.nil?
      "0000000000"
    else
      homephone.scan(/\d/).join
    end
  end

  def clean_city(city)
    city.downcase
  end

  def clean_state(state)
    state.upcase
  end
end
