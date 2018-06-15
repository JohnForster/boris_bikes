require './lib/bike.rb'
require './lib/collection.rb'

# The docking station for bikes in the Boris Bike project.
class DockingStation
  DEFAULT_CAPACITY = 20
  DEFAULT_OCCUPATION = 0
  def initialize(capacity: DEFAULT_CAPACITY, occupation: DEFAULT_OCCUPATION)
    raise 'Occupation over capacity' if occupation > capacity
    @capacity = capacity
    @bikes = Collection.new
    occupation.times { @bikes.add_bike(Bike.new) }
  end

  attr_reader :bikes

  def release_bike
    raise 'No bike to release.' if empty?
    @bikes.release_bike
  end

  def report_broken(bike)
    bike.working = false
  end

  def dock(bike)
    raise 'Docking station full.' if full?
    @bikes.add_bike(bike)
    bike
  end

  private

  def empty?
    @bikes.bike_array.empty?
  end

  def full?
    @bikes.bike_array.size >= @capacity
  end
end
