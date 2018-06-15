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

  it 'should have adaptable capacity' do
    dc = DockingStation.new(capacity: 5)
    expect { 5.times { dc.dock(Bike.new) } }.not_to raise_error
    expect { dc.dock(Bike.new) }.to raise_error 'Docking station full.'

    dc2 = DockingStation.new(capacity: 30)
    expect { 30.times { dc2.dock(Bike.new) } }.not_to raise_error
    expect { dc2.dock(Bike.new) }.to raise_error 'Docking station full.'
  end

  it 'should have adaptable occupation' do
    dc = DockingStation.new(occupation: 5)
    expect { 5.times { dc.release_bike } }.not_to raise_error
    expect { dc.release_bike }.to raise_error 'No bike to release.'

    dc2 = DockingStation.new(occupation: 10)
    expect { 10.times { dc2.release_bike } }.not_to raise_error
    expect { dc2.release_bike }.to raise_error 'No bike to release.'
  end
end
