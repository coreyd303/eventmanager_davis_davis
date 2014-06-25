require './lib/attendee_repository'
require './lib/search'
require 'pry'

class CLI
  attr_reader :data, :queue, :search

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
  end

  def queue_count
    print queue.count
  end

  def queue_clear
    @queue = []
    print "The queue has been cleared."
  end

  def queue_print
    header = ""
    column_names = ["LAST NAME", "FIRST NAME", "EMAIL", "ZIPCODE", "CITY", "STATE", "ADDRESS", "PHONE"]
    column_names.each do |title|
      header += title.center(20)
    end
    print header
    @queue.each do |a| #START HERE!!!!!!
      puts "#{a.last_name.capitalize} #{a.first_name.capitalize} #{a.zipcode} #{a.city.capitalize} #{a.state} #{a.homephone}"
    end
  end

  def queue_print_by(attribute)
  end

  def queue_save_to(filename)
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
      # when "queue print by" print_by(attribute)
      # when "queue save to" then queue_save_to(filename.csv)
      when "find" then find(parameter, argument)
      when "quit" then puts "Have a nice a day!"
      else
        puts "Sorry, #{@command} is an invalid command."
      end
    end
  end

end

cli = CLI.new
cli.run
