require_relative 'calendar'

describe Calendar do
  before(:all) do
    hash = {}
    @events = Calendar.new(hash)
    @string = '20191117'
    @name = 'event1'
    @desc = 'description1'
    @date = Date.parse(@string)
    SUCCESS = 'Event added successfully'.freeze
    EXISTS = 'Event already exist'.freeze
    REMOVED = 'Event Removed'.freeze
    NOT_FOUND = 'Event not found'.freeze
    UPDATED = 'Event updated'.freeze
  end
  it 'should return string = Event added successfully' do
    expect(@events.add_event(@date, @name, @desc)).to eq SUCCESS
  end

  it 'shoud return string = Event not found' do
    n = 'new event'
    expect(@events.remove_event(@date, n)).to eq NOT_FOUND
  end

  it 'should return string = Event updated' do
    new_name = 'event2'
    new_desc = 'abcd'
    expect(@events.edit_event(@date, @name, new_name, new_desc)).to eq UPDATED
  end

  it 'shoud return string = Event Removed' do
    new_name = 'event2'
    expect(@events.remove_event(@date, new_name)).to eq REMOVED
  end

  it 'should return string = Event not found' do
    new_name = 'new event'
    new_desc = 'abcd'
    expect(@events.edit_event(@date, @name, new_name, new_desc)).to eq NOT_FOUND
  end

  it 'should return nil' do
    expect(@events.print_event_details(@date)).to eq nil
  end

  it 'should return nil' do
    expect(@events.print_month_details(@date)).to eq nil
  end
end
