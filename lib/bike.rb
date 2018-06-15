# The bike class. Released from docking station.
class Bike
  def initialize
    @working = true
  end

  def break
    @working = false
  end

  def fix
    @working = true
  end

  def working?
    @working
  end
end
