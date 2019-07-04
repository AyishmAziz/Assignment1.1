require_relative 'event'
require 'date'
class Calendar
  attr_accessor :calendar_hash
  SUCCESS = 'Event added successfully'.freeze
  EXISTS = 'Event already exist'.freeze
  REMOVED = 'Event Removed'.freeze
  NOT_FOUND = 'Event not found'.freeze
  UPDATED = 'Event updated'.freeze
  def initialize(calendar)
    @calendar_hash = calendar
  end

  def add_event(date, e_name, e_desc)
    temp_event = Event.new(e_name, e_desc)
    calendar_hash[date] ||= [] if !calendar_hash.key?(date)
    if !calendar_hash[date].find { |x| x.name == e_name }
      calendar_hash[date] << temp_event
      SUCCESS
    else
      EXISTS
    end
  end

  def remove_event(date, e_name)
    if calendar_hash.key?(date)
      if calendar_hash[date].find { |x| x.name == e_name }
        calendar_hash[date].reject! { |x| x.name == e_name }
        REMOVED
      else
        NOT_FOUND
      end
    else
      NOT_FOUND
    end
  end

  def edit_event(date, old_name, new_name, new_desc)
    if calendar_hash.key?(date)
      temp_event = calendar_hash[date].find { |x| x.name == old_name }
      if !temp_event.nil?
        temp_event.name = new_name
        temp_event.description = new_desc
        UPDATED
      else
        NOT_FOUND
      end
    else
      NOT_FOUND
    end
  end

  def print_calendar(curr_date)
    next_month = curr_date >> 1
    puts "M\tT\tW\tTH\tF\tST\tS"
    space = 0
    if curr_date.tuesday? then space = 1
    elsif curr_date.wednesday? then space = 2
    elsif curr_date.thursday? then space = 3
    elsif curr_date.friday? then space = 4
    elsif curr_date.saturday? then space = 5
    elsif curr_date.sunday? then space = 6
    end
    1.upto(space) { print "\t" }
    curr_date.upto(next_month) do |date|
      event_num = 0
      event_num = calendar_hash[date].count if calendar_hash.key?(date)
      print date.strftime('%d')
      print "(#{event_num})" if event_num > 0
      print "\t"
      puts if date.sunday?
    end
    puts
  end

  def print_event_details(date)
    if calendar_hash.key?(date)
      if calendar_hash[date].count.zero?
        puts NOT_FOUND
      else
        calendar_hash[date].each { |x| puts "Event name = #{x.name} and event description = #{x.description}" }
      end
    else
      puts NOT_FOUND
    end
  end

  def print_month_details(date)
    next_month = date >> 1
    flag = 0
    date.upto(next_month) do |date_loop|
      if calendar_hash.key?(date_loop)
        calendar_hash[date_loop].each do |x|
            puts "Event date = #{date_loop} Event name = #{x.name} Event description = #{x.description}"
          flag = 1
          end
      end
    end
    puts NOT_FOUND if flag.zero?
  end
end
