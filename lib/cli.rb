# user launches EventReporter
# user is provided a command prompt
# after a command completes, the prompt returns and awaits another instruction
#
# the queue:
# holds the stored results from a seach
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
    "Welcome to Event Reporter's help section. If you would like more information on an available command, enter 'Command Help' followed by the command name.\n" +
    "Here are the commands available to you:\n"
  end

  def command_help(command)
  end

  def load(filename=event_attendess.csv)
  end

  def find(attribute, criteria)
  end

  def queue_count
  end

  def queue_clear
  end

  def queue_print
  end

  def queue_print_by(attribute)
  end

  def queue_save_to(filename)
  end

  def run
    puts "Welcome to Event Reporter! Enter 'help' for a list of available commands."
    command = ""
    command = parts[0]
    while command != "q"
      puts ""
      printf "Enter Command:"
      case command
      when "load" then load<filename>
      when "help" then help
      when "command help" then command_help(command)
      when "queue count" then
      when "queue clear" then
      when "queue print" then
      when "queue print by" print_by(attribute)
      when "queue save to" then queue_save_to(filename.csv)
      when "find" then find(attribute, criteria)
    else
      puts "Sorry, #{command} is an invalid command."
    end
  end


end
