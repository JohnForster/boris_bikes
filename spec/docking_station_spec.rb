require './lib/docking_station.rb'

describe DockingStation do
  docking_station = DockingStation.new
  it { should respond_to(:release_bike) }
  it 'should be able to release a working bike' do
    bike = docking_station.release_bike
    expect(bike.class).to eq Bike
    expect(bike.working?).to eq true
  end
end
