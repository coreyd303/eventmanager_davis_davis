class MessagePrinter

  def run_welcome_message
    puts ''
    print "Welcome to Event Reporter. Enter 'help' for a list of available commands.".cyan.bold
    puts ''
  end

  def help_message
    print "\n" +
    "Welcome to Event Reporter's help section. If you would like more information on an available command, enter 'Command Help' followed by the command name.\n" +
    "Here are the commands available to you:\n" +
    "\n" +
    "'load'\n" +
    "'find'\n" +
    "'queue count'\n" +
    "'queue clear'\n" +
    "'queue print'\n" +
    "'queue print_by'\n"+
    "'queue save_to'\n"
  end

  def help_load_message
    print "Erase any loaded data and parse the specified file. If no filename is given, default to 'event_attendees.csv'.".cyan
  end

  def help_find_message
    print "Load the queue with all records matching the criteria for the given attribute.".cyan
  end

  def help_queue_count_message
    print "Output how many records are in the current queue.".cyan
  end

  def help_queue_clear_message
    print "Empty the queue.".cyan
  end

  def help_queue_print_message
    print "Print out a tab-delimited data table.".cyan
  end

  def help_print_by_message
    print "Print the data table sorted by the given attribute.".cyan
  end

  def help_queue_save_to_message
    print "Export the current queue to the specified file name as a .CSV.".cyan
  end

  def queue_clear_message
    print "The queue has been cleared.".magenta
  end
end
