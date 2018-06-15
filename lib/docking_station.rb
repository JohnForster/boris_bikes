require './lib/bike.rb'
require './lib/collection.rb'

# The docking station for bikes in the Boris Bike project.
class DockingStation
  def initialize
    @bikes = Collection.new
  end

  attr_reader :bikes

  def release_bike
    raise 'No bike to release.' if @bikes.empty?
    @bikes.release_bike
  end

  def dock(bike)
    raise 'Docking station full.' if @bikes.full?
    @bikes.add_bike(bike)
    bike
  end
end
