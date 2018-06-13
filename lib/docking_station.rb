require './lib/bike.rb'

# The docking station for bikes in the Boris Bike project.
class DockingStation
  def release_bike
    Bike.new
  end
end
