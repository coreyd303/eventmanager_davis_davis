class QueuePrinter

  attr_reader :queue

  def initialize(queue)
    @queue = queue
  end

  def print
    rows = []
    queue.each do |a|
    rows << ["#{a.id}",
             "#{a.regdate}",
             "#{a.last_name.capitalize}",
             "#{a.first_name.capitalize}",
             "#{a.email}",
             "#{a.zipcode}",
             "#{a.city.capitalize}",
             "#{a.state}",
             "#{a.address}",
             "#{a.phone}"]
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
