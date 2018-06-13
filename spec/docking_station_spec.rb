require './lib/docking_station.rb'

describe DockingStation do
  before do
  end

  docking_station = DockingStation.new
  bike = docking_station.release_bike

  it { should respond_to(:release_bike) }
  it 'should be able to release a bike' do
    expect(bike.class).to eq Bike
  end
  it 'the released bike should be working' do
    expect(bike.working?).to eq true
  end
  it 'should respond to docking' do
    docking_station.should respond_to(:dock).with(1).argument
  end
  it 'should be able to list docked bikes' do
    docking_station.should respond_to(:bike)
  end
end
