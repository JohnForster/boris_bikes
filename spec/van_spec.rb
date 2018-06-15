require './lib/docking_station'

describe Van do
  it 'should be able to pick up bikes from a location' do
    location = double(:location, :release_bike => Bike.new(false))
    expect(subject.pickup_from(location)).to be_a Bike
  end
  it 'should be able to drop bikes off at a location' do
    bike = double(:bike)
    location = double(:location, :dock => Bike.new)
    expect(subject.drop_off(bike, location)).to be_a Bike
  end
end
