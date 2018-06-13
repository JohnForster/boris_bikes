require './lib/docking_station.rb'

describe DockingStation do
  before do
  end
  it { should respond_to(:release_bike) }
  it 'should be able to release a bike' do
    expect(subject.release_bike.class).to eq Bike
  end
  it 'the released bike should be working' do
    expect(subject.release_bike.working?).to eq true
  end
  it 'should respond to docking' do
    subject.should respond_to(:dock).with(1).argument
  end
  it 'should be respond to #bike' do
    subject.should respond_to(:bike)
  end
  it 'docks something' do
    bike = Bike.new
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq bike
  end
  it 'returns docked bike(s)' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end
  it 'when releasing a bike, return error if no bikes are available' do
    expect { subject.release_bike }.to raise_error('No bikes available')
  end
end
