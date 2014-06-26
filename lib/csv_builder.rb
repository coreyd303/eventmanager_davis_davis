class CSVBuilder
  attr_reader :filename,
              :queue

  def initialize(filename, queue)
    @filename = filename
    @queue = queue
  end

  def save_to_csv
    CSV.open(filename, "w") do |csv|
      csv << ['ID','REGDATE','LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
      queue.each do |entry|
        csv << [entry.id,entry.regdate,entry.last_name,entry.first_name,entry.email,entry.zipcode,entry.city,entry.state,entry.address,entry.phone]
      end
    end
    puts "Your queue has been save to '#{filename}'.".bold.blue
  end
  
end
