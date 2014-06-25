require 'colorize'
require 'rubygems'
require 'ValidateEmail'
require 'terminal-table'
require 'csv'

Dir['./lib/*.rb'].each{ |file| require "#{file}" } #loads & requires any files in the .lib

CLI.new.run
