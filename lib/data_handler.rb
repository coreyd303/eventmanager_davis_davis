require './lib/attendee_repository'

class DataHandler

  def clean_id(id)
    id.to_s
  end

  def clean_registration_date(regdate)
    regdate.to_s
  end

  def clean_first_name(first_name)
    first_name.downcase
  end

  def clean_last_name(last_name)
    last_name.downcase
  end

  def clean_email(email_address)
    if ValidateEmail.validate(email_address)
      email_address.to_s
    else
      puts nil
    end
  end

  def clean_phone_number(homephone)
    if homephone.nil?
      "0000000000"
    else
      homephone.scan(/\d/).join
    end
  end

  def clean_address(street)
    street.to_s
  end

  def clean_city(city)
    city.to_s.downcase
  end

  def clean_state(state)
    state.to_s.upcase
  end

  def clean_zipcode(zipcode)
    if zipcode.nil? || zipcode.length > 5
      "00000"
    elsif zipcode.length < 5
      zipcode.rjust(5, "0")
    else
      zipcode
    end
  end
end
