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

  def help
    if print "\n" +
      "Welcome to Event Reporter's help section. If you would like more information on an available command, enter 'Command Help' followed by the command name.\n" +
      "Here are the commands available to you:\n" +
      "\n" +
      "'command help'\n" +
      "'load'\n" +
      "'find'\n" +
      "'result count'\n" +
      "'result clear'\n" +
      "'result print'\n" +
      "'result print_by'\n" +
      "'result save_to'\n"
    end
  end

  def command_help(command)
    print "\n"
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
    criteria = criteria.first.downcase
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
  end

  def run
    puts "Welcome to Event Reporter. Enter 'help' for a list of available commands."
    command = ""
    until @command == "quit"
      puts ""
      printf "Enter Command: "
      input = gets.strip
      parts = input.split(" ")
      @command = parts[0]
      parameter = parts[1]
      argument = parts[2..-1]
      case @command
      when "help" then help
      # when "command help" then command_help(command)
      when "load" then load(parts[1])
      #needs to accept "queue count"
      when "queue_count" then queue_count
      when "queue_clear" then queue_clear
      when "queue_print" then queue_print
      when "queue_print_by" then queue_print_by(parameter)
      when "queue_save_to" then queue_save_to(parameter)
      when "find" then find(parameter, argument)
      when "quit" then puts "Have a nice a day!"
      else
        puts "Sorry, #{@command} is an invalid command."
      end
    end
  end

end
