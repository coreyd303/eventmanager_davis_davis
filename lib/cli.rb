require './lib/attendee_repository'
require './lib/search'
require 'pry'
require 'terminal-table'
require 'colorize'
require 'csv'

class CLI
  attr_reader :data, :queue, :search, :table, :queue_print
  attr_writer :filename

  def initialize
    @queue  = []
    @search = nil
  end

  def help(command)
    if command == nil
      print "\n" +
      "Welcome to Event Reporter's help section. If you would like more information on an available command, enter 'Command Help' followed by the command name.\n" +
      "Here are the commands available to you:\n" +
      "\n" +
      "'load'\n" +
      "'find'\n" +
      "'queue count'\n" +
      "'queue clear'\n" +
      "'queue print'\n" +
      "'queue print_by'\n" +
      "'queue save_to'\n"
    elsif command == "load"
      print "Erase any loaded data and parse the specified file. If no filename is given, default to 'event_attendees.csv'."
    elsif command == "find"
      print "Load the queue with all records matching the criteria for the given attribute."
    elsif command == "queue count"
      print "Output how many records are in the current queue."
    elsif command == "queue clear"
      print "Empty the queue."
    elsif command == "queue print"
      "Print out a tab-delimited data table."
    elsif command == "print_by"
      print "Print the data table sorted by the specified attribute."
    elsif command == "save_to"
      print "Export the current queue to the specified filename as a CSV."
    end
  end

  def load(filename)
    if filename == nil
      filename = './event_attendees.csv'
    else
      filename = filename
    end
    @search = Search.new(filename)
    puts "Your file, #{filename}, has been loaded."
  end

  def find(attribute, criteria)
    @queue = []
    criteria = criteria.each do |c|
      c.downcase
    end
    criteria = criteria.join(' ')
    results = search.send("find_by_#{attribute}", criteria)
    @queue << results
    @queue.flatten!
    print "The queue has been loaded with the results of your search for '#{attribute}' '#{criteria}'.\n" +
    "There were #{queue.count} results.\n"
  end

  def queue_count
    print queue.count
  end

  def queue_clear
    @queue = []
    print "The queue has been cleared."
  end

  def queue_print
    rows = []
    @queue.each do |a|
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

  def queue_print_by(attribute)
    @queue.sort_by! do |entry|
      entry.send(attribute)
    end
    queue_print
  end

  def queue_save_to(filename)
    CSV.open(filename, "w") do |csv|
      csv << ['ID','REGDATE','LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
      queue.each do |entry|
        csv << [entry.id,entry.regdate,entry.last_name,entry.first_name,entry.email,entry.zipcode,entry.city,entry.state,entry.address,entry.phone]
      end
    end
    puts "Your queue has been save to '#{filename}'."
  end

  def queue_command(params)
    command = params[0]

    case command
    when "count" then queue_count
    when "clear" then queue_clear
    when "print" then queue_print_command(params[1..-1])
    when "save" then queue_save_to(params[2])
    end
  end

  def queue_print_command(params)
    if params.empty?
      queue_print
    else
      # TODO: Deal with
      queue_print_by(params[1])
    end
  end

  def run
    puts "Welcome to Event Reporter. Enter 'help' for a list of available commands."
    command = ""
    until @command == "quit"
      puts ""
      printf "Enter Command: "
      input = gets.downcase.strip
      parts = input.split(" ")
      @command = parts[0]
      parameter = parts[1]
      argument = parts[2..-1]
      case @command
      when "help" then help(parameter)
      when "load" then load(parts[1])
      when "queue" then queue_command(parts[1..-1])
      when "find" then find(parameter, argument)
      when "quit" then puts "Have a nice a day!"
      else
        puts "Sorry, #{@command} is an invalid command."
      end
    end
  end

end
