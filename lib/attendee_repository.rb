class AttendeeRepository
  attr_reader :csv,
              :attendees

  def initialize(filename='./event_attendees.csv')
    @csv = CSV.open(filename, headers: true, header_converters: :symbol)
    @attendees = []
  end

  def build_attendees
    @csv.each do |row|
      @attendees << Attendee.new(row)
    end
  end
end
