require_relative 'calendar'
require 'date'

def menu
  hash = {}
  events = Calendar.new(hash)
  puts '****Calendar****'
  puts '1- Add an event     2- Remove an event'
  puts '3- Edit an event    4- Print calendar in month style'
  puts '5- Print event details    6- Print events of a month'
  puts 'Press 7 to ecape'
  puts 'Enter option'
  option = gets
  option = option.to_i
  while option != 7
    begin
      if option == 1
        puts 'Enter date in format yyyymmdd'
        string = gets
        date = Date.parse(string)
        puts 'Enter name for the event'
        event_name = gets
        puts 'Enter description for the event'
        event_desc = gets
        puts events.add_event(date, event_name, event_desc)
      elsif option == 2
        puts 'Enter date in format yyyymmdd'
        string = gets
        date = Date.parse(string)
        puts 'Enter name for the event'
        event_name = gets
        puts events.remove_event(date, event_name)
      elsif option == 3
        puts 'Enter date in format yyyymmdd'
        string = gets
        date = Date.parse(string)
        puts 'Enter name for the event'
        event_name = gets
        puts 'Enter new name for the event'
        new_name = gets
        puts 'Enter new description for the event'
        new_desc = gets
        puts events.edit_event(date, event_name, new_name, new_desc)
      elsif option == 4
        puts 'Enter date in format yyyymmdd'
        string = gets
        date = Date.parse(string)
        events.print_calendar(date)
      elsif option == 5
        puts 'Enter date in format yyyymmdd'
        string = gets
        date = Date.parse(string)
        events.print_event_details(date)
      elsif option == 6
        puts 'Enter date in format yyyymmdd'
        string = gets
        date = Date.parse(string)
        events.print_month_details(date)
      end
      puts 'Enter option'
      option = gets
      option = option.to_i
    rescue ArgumentError
      puts 'Incorrect format. Enter again'
      retry if string =~ /\A\d{4}\d{2}\d{2}\z/
    end
  end
end

menu
