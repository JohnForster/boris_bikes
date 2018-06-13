require './lib/bike.rb'

# The docking station for bikes in the Boris Bike project.
class DockingStation
  def initialize
    @bike = ''
  end

  attr_reader :bike

  def release_bike
    raise('No bikes available') if @bike.empty?
  end

  def dock(bike)
    @bike = bike
  end
end
