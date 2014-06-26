class QueuePrinter

  attr_reader :queue

  def initialize(queue)
    @queue = queue
  end

  def print
    rows = []
    queue.each do |a|
    rows << ["#{a.id}".light_blue,
             "#{a.regdate}".cyan,
             "#{a.last_name.capitalize}".yellow.bold,
             "#{a.first_name.capitalize}".yellow.bold,
             "#{a.email}".cyan.bold,
             "#{a.zipcode}".cyan,
             "#{a.city.capitalize}".cyan,
             "#{a.state.upcase}".cyan,
             "#{a.address}".cyan,
             "#{a.phone}".cyan]
    end
    table = Terminal::Table.new :headings => ['ID'.bold,
                                              'REGDATE'.bold,
                                              'LAST NAME'.bold,
                                              'FIRST NAME'.bold,
                                              'EMAIL'.bold,
                                              'ZIPCODE'.bold,
                                              'CITY'.bold,
                                              'STATE'.bold,
                                              'ADDRESS'.bold,
                                              'PHONE'.bold],
                                              :rows => rows
    puts table
  end

end
