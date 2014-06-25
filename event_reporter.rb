require 'colorize'
require 'rubygems'
require 'ValidateEmail'
require 'terminal-table'

Dir['./lib/*.rb'].each{ |file| require "#{file}" } #loads & requires any files in the .lib

CLI.new.run
