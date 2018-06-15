require './lib/bike.rb'

# The collection of bikes in a docking station.
class Collection
  def initialize
    @bike_array = []
  end

  attr_reader :bike_array

  # def empty?
  #   @bike_array.empty?
  # end

  # def full?
  #   @bike_array.size == @capacity
  # end

  def release_bike(index = -1)
    @bike_array.delete_at(index)
  end

  def add_bike(bike)
    @bike_array << bike
  end
end
