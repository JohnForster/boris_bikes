require './lib/bike.rb'

# The docking station for bikes in the Boris Bike project.
class DockingStation
  # def initialize
  #   @bikes = []
  #   5.times { @bikes << Bike.new }
  # end

  attr_reader :bike

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end
end
