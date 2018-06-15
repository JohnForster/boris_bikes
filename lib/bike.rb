# The bike class. Released from docking station.
class Bike
  def initialize(working: true)
    @working = !!working
  end

  attr_writer :working
  def working?
    @working
  end
end
