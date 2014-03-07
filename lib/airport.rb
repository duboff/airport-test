class Airport
  attr_reader :planes
  
  DEFAULT_CAPACITY = 20
  
  attr_writer :capacity

  def initialize
    @planes = []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def land(plane)
    raise "The airport is full" if full?
    planes << plane
    plane.land
  end

  def take_off(plane)
    planes.delete(plane)
    plane.take_off
  end

  def full?
    planes.size == capacity
  end

end