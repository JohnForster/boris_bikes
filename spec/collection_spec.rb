require './lib/collection.rb'

describe Collection do
  it 'should respond to #bike_array' do
    expect(subject).to respond_to(:bike_array)
  end

  it 'should add a bike to bike_array' do
    bike1 = double(:bike)
    subject.add_bike(bike1)
    expect(subject.bike_array[0]).to eq(bike1)
  end

  it 'should release a stored bike' do
    bike1 = double(:bike, :working? => true)
    subject.add_bike(bike1)
    expect(subject.release_bike).to eq bike1
    expect(subject.bike_array.size).to eq 0
  end
end
