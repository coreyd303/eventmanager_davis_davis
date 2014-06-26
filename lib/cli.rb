require './lib/attendee_repository'
require './lib/search'
require 'pry'
require 'terminal-table'
require 'colorize'
require 'csv'
require './lib/queue_printer'
require './lib/message_printer'

class CLI
  attr_reader :data, :queue, :search, :table, :queue_print
  attr_writer :filename

  def initialize
    @queue  = []
    @search = nil
  end

  def help(command)
    case command
    when nil
      MessagePrinter.new.help_message
    when "load"
      MessagePrinter.new.help_load_message
    when "find"
      MessagePrinter.new.help_find_message
    when "queue"
      help_command(command[1..-1])
    # when "queue clear"
    #   MessagePrinter.new.help_queue_clear_message
    # when "queue print"
    #   MessagePrinter.new.help_queue_print_message
    when "queue print_by"
      MessagePrinter.new.help_print_by_message
    when "queue save_to"
      MessagePrinter.new.help_save_to_message
    end
  end

  def help_command(params)
    command = params[1]

    case command
    when "count" then MessagePrinter.new.help_queue_count_message
      # help_queue_command(parts[2..-1])
    end
  end

  def help_queue_command(params)
    command = instruction[2]

    case command
    when "count" then MessagePrinter.new.help_queue_count_message
    when "clear" then MessagePrinter.new.help_queue_clear_message
    when "print" then MessagePrinter.new.help_queue_print_message
    when "save"  then MessagePrinter.new.help_queue_save_to_message
    end
  end

  # def queue_command(params)
  #   command = params[0]
  #
  #   case command
  #   when "count" then queue_count
  #   when "clear" then queue_clear
  #   when "print" then queue_print_command(params[1..-1])
  #   when "save"  then queue_save_to(params[2])
  #   end
  # end
  #
  # def queue_print_command(params)
  #   if params.empty?
  #     queue_print
  #   else
  #     queue_print_by(params[1])
  #   end
  # end

  def load(filename)
    filename = './event_attendees.csv' if filename == nil
    @search = Search.new(filename)
    puts "Your file, #{filename}, has been loaded.".bold.blue
  end

  def find(attribute, criteria)
    @queue = []
    criteria = criteria.each {|c| c.downcase}.join(' ')
    results = search.send("find_by_#{attribute}", criteria)
    @queue << results
    @queue.flatten!
    puts "The queue has been loaded with the results of your search for '#{attribute}':  '#{criteria}'.\n" +
    "There were #{queue.count} results.\n".bold.blue
  end

  def queue_count
    print queue.count
  end

  def queue_clear
    @queue = []
    MessagePrinter.new.queue_clear_message
  end

  def queue_print
    QueuePrinter.new(@queue).print
  end

  def queue_print_by(attribute)
    @queue.sort_by! do |entry|
      entry.send(attribute)
    end
    queue_print
  end

  def queue_save_to(filename)
    #CSVBuilder.new(@queue, filename).save_to_csv
    CSV.open(filename, "w") do |csv|
      csv << ['ID','REGDATE','LAST NAME','FIRST NAME','EMAIL','ZIPCODE','CITY','STATE','ADDRESS','PHONE']
      queue.each do |entry|
        csv << [entry.id,entry.regdate,entry.last_name,entry.first_name,entry.email,entry.zipcode,entry.city,entry.state,entry.address,entry.phone]
      end
    end
    puts "Your queue has been save to '#{filename}'.".bold.blue
  end

  def queue_command(params)
    command = params[0]

    case command
    when "count" then queue_count
    when "clear" then queue_clear
    when "print" then queue_print_command(params[1..-1])
    when "save"  then queue_save_to(params[2])
    end
  end

  def queue_print_command(params)
    if params.empty?
      queue_print
    else
      queue_print_by(params[1])
    end
  end

  def run
    MessagePrinter.new.run_welcome_message
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
      when "help"  then help(parameter)
      when "load"  then load(parts[1])
      when "queue" then queue_command(parts[1..-1])
      when "find"  then find(parameter, argument)
      when "quit"  then puts "Have a nice a day!"
      else
        puts "Sorry, #{@command} is an invalid command."
      end
    end
  end
end
