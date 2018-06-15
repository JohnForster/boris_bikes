require './lib/bike.rb'

# The collection of bikes in a docking station.
class Collection
  def initialize
    @bike_array = []
  end

  attr_reader :bike_array

  def release_bike(index = -1)
    unless @bike_array[index].working?
      raise "Bike is broken, and so can't be released."
    end
    @bike_array.delete_at(index)
  end

  def add_bike(bike)
    @bike_array << bike
  end
end
