require './lib/docking_station.rb'
require './lib/collection.rb'

# Vans pick up and transport bikes.
class Van
  def initialize
    @stored_bikes = Collection.new
  end
end
