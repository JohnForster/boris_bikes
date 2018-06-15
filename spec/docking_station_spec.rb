require './lib/docking_station.rb'

describe DockingStation do
  it { should respond_to(:release_bike) }

  it 'the released bike should be working' do
    subject.dock(double(:bike))
    bike = subject.release_bike
    # Will fail for now as we have not mocked the behaviour of Bike
    expect(bike).to be_working
  end

  it 'should respond to #dock' do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it 'should respond to #bikes' do
    expect(subject).to respond_to(:bikes)
  end

  it 'docks something' do
    bike = double(:bike)
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bike(s)' do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error if there are no bikes to release' do
    expect { subject.release_bike }.to raise_error('No bike to release.')
  end

  it 'raises an error if you try to dock a bike into a full docking station' do
    20.times { subject.dock(double(:bike)) }
    expect do
      subject.dock(double(:bike))
    end.to raise_error('Docking station full.')
  end

  it 'should have adaptable capacity' do
    dc = DockingStation.new(capacity: 5)
    expect { 5.times { dc.dock(double(:bike)) } }.not_to raise_error
    expect { dc.dock(double(:bike)) }.to raise_error 'Docking station full.'

    dc2 = DockingStation.new(capacity: 30)
    expect { 30.times { dc2.dock(double(:bike)) } }.not_to raise_error
    expect { dc2.dock(double(:bike)) }.to raise_error 'Docking station full.'
  end

  it 'should have adaptable occupation' do
    dc = DockingStation.new(occupation: 5)
    expect { 5.times { dc.release_bike } }.not_to raise_error
    expect { dc.release_bike }.to raise_error 'No bike to release.'

    dc2 = DockingStation.new(occupation: 10)
    expect { 10.times { dc2.release_bike } }.not_to raise_error
    expect { dc2.release_bike }.to raise_error 'No bike to release.'
  end

  it 'should be possible to report a bike as broken' do
    expect(subject).to respond_to(:report_broken)
  end

  it "a reported bike should know it's broken" do
    bike = double(:bike)
    subject.report_broken(bike)
    # Test will currently fail as we have not mocked behaviour of Bike
    expect(bike).not_to be_working
  end

  it 'should be possible to dock a broken bike' do
    bike = double(:bike)
    subject.report_broken(bike) # not yet mocked behaviour
    expect(subject.dock(bike)).to eq bike
  end

  it 'should not be possible to release a broken bike' do
    bike = double(:bike)
    subject.report_broken(bike) # Not yet mocked behaviour
    subject.dock(bike)
    expect do
      subject.release_bike
    end.to raise_error "Bike is broken, and so can't be released."
  end
end
