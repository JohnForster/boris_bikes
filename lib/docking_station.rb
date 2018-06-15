require './lib/bike.rb'

# The docking station for bikes in the Boris Bike project.
class DockingStation
  def initialize
    @bike = ''
  end

  attr_reader :bike

  def release_bike
    raise 'No bike to release.' unless @bike
    bike_to_return = @bike
    @bike = nil
    bike_to_return
  end

  def dock(bike)
    raise 'Docking station full.' if @bike
    @bike = bike
  end
end
