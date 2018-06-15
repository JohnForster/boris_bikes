require './lib/bike.rb'

# The collection of bikes in a docking station.
class Collection
  def initialize(capacity = 20, occupation = 0)
    @bike_array = []
    @capacity = capacity
    occupation.times { @bike_array << Bike.new }
  end

  def empty?
    @bike_array.empty?
  end

  def full?
    @bike_array.size == @capacity
  end

  def release_bike(index = -1)
    @bike_array.delete_at(index)
  end

  def add_bike(bike)
    @bike_array << bike
  end
end
