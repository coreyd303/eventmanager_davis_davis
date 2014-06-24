# user launches EventReporter
# user is provided a command prompt
# after a command completes, the prompt returns and awaits another instruction
#
# the queue:
# holds the stored results from a search
# is not cleared unless the user runs the command 'queue clear' or a new find command
#
# commands:
# load <filename>: erases any loaded date and parses the specified file - defaults to event_attendees.csv
# help: list of available commands
# help <command>: describes how to use a specific command
# queue count: outputs how many records are in the current queue
# queue clear: empties the queue
# queue print: prints out a tab-delimited data table with header row (LAST NAME FIRST NAME EMAIL ZIPCODE CITY STATE ADDRESS PHONE)
# queue print by <attriute>: prints the data table sort by a specific attribute
# queue save to <filename.csv>: exports the current queue to the specified filename as a csv
# find <attribute> <criteria>: load the queue with all records matching the criteria for the given attribute

class CLI
  def initialize
  end

  def help
    print "\n" +
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

  def command_help(command)
    print "\n"


  end

  def load(filename='event_attendess.csv')
    CSV.open(filename, headers: true, header_converters: :symbol)
  end

  def find(attribute, criteria)
  end

  def result_count
  end

  def result_clear
  end

  def result_print
  end

  def result_print_by(attribute)
  end

  def result_save_to(filename)
  end

  def run
    puts "Welcome to Event Reporter. Enter 'help' for a list of available commands."
    command = ""
    until @command == "quit"
      puts ""
      printf "Enter Command: "
      input = gets.chomp
      parts = input.split(" ")
      @command = parts[0]
      case @command
      when "help" then help
      # when "command help" then command_help(command)
      # when "load" then load<filename>
      # when "search count" then
      # when "search clear" then
      # when "search print" then
      # when "search print by" print_by(attribute)
      # when "queue save to" then queue_save_to(filename.csv)
      # when "find" then find(attribute, criteria)
      when "quit" then puts "Have a nice a day!"
      else
        puts "Sorry, #{command} is an invalid command."
      end
    end
  end

end

cli = CLI.new
cli.run
