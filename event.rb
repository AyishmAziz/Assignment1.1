class Event
  attr_accessor :name
  attr_accessor :description
  def initialize(ename, desc)
    @name = ename
    @description = desc
  end
end
