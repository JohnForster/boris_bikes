require './lib/docking_station.rb'

describe DockingStation do
  it { should respond_to(:release_bike) }

  it 'should be able to release a bike' do
    subject.dock(Bike.new)
    expect(subject.release_bike.class).to eq Bike
  end

  it 'the released bike should be working' do
    subject.dock(Bike.new)
    expect(subject.release_bike.working?).to eq true
  end

  it 'should respond to #dock' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'should respond to #bikes' do
    expect(subject).to respond_to(:bikes)
  end

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bike(s)' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error if there are no bikes to release' do
    expect { subject.release_bike }.to raise_error('No bike to release.')
  end

  it 'raises an error if you try to dock a bike into a full docking station' do
    20.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error('Docking station full.')
  end
end
