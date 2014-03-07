require 'weather'

class Airport
  attr_reader :planes, :weather
  attr_writer :weather
  
  DEFAULT_CAPACITY = 6
  
  attr_writer :capacity

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
    self.weather = options.fetch(:weather, weather)
    @planes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def weather
    @weather ||= Weather.new
  end

  def stormy?
    weather.stormy?
  end

  def get_weather
    weather.generate_weather
  end

  def add_plane(plane)
    planes << plane
  end

  def land(plane)
    raise "The airport is full" if full?
    raise "Can't accept a plane, Cap. It's stormy" if stormy?
    planes << plane
    plane.land
  end

  def take_off(plane)
    raise "Can't take off, Cap. It's stormy" if stormy?
    raise "This plane is not there" if !planes.include?(plane)
    planes.delete(plane)
    plane.take_off
  end

  def full?
    planes.size == capacity
  end

end