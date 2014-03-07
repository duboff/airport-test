require 'airport'

describe Airport do
  let(:fine_weather) {double :weather, {:stormy? => false } }
  let(:airport) { Airport.new({:weather => fine_weather}) }
  let(:plane) {Plane.new}
  let(:stormy_weather) {double :weather, {:stormy? => true}}
  let(:stormy_airport) { Airport.new({:weather => stormy_weather}) }

   context 'default behaviour' do
    it 'not have any planes when created' do
      expect(airport.planes).to be_empty
    end
  end

  context 'taking off and landing' do
    it 'a plane can land' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'a plane landed at the airport knows it has landed' do
      airport.land(plane)
      expect(plane).not_to be_flying
    end
    
    it 'a plane take off from the airport knows it is flying' do
      airport.land(plane)
      airport.take_off(plane)
      expect(plane).to be_flying
    end

  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full ' do
     airport.capacity.times { airport.land(Plane.new) }
     expect( lambda { airport.land(plane)} ).to raise_error(RuntimeError)
    end

    it 'a plane cannot take off if it is not at the airport ' do
     expect( lambda { airport.take_off(plane)} ).to raise_error(RuntimeError)
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      
      it 'a plane cannot take off when there is a storm brewing' do
        stormy_airport.add_plane(plane)
        expect(lambda { stormy_airport.take_off(plane)} ).to raise_error(RuntimeError)
        expect(stormy_airport.planes).to include plane
      end
      
      it 'a plane cannot land in the middle of a storm' do
        expect(lambda { stormy_airport.land(plane)} ).to raise_error(RuntimeError)
      end

    end
  end
end


describe "The grand finale (last spec)" do
  let(:fine_weather) {double :weather, {:stormy? => false } }
  let(:airport) { Airport.new({:weather => fine_weather, :capacity => 6}) }
  let(:six_planes) {Array.new(6, Plane.new)}
  let(:repetitions) {6}

  it 'all planes can land' do
    six_planes.each {|plane| airport.land(plane)}
    expect(airport.planes.size).to eq 6
  end

  it 'all landed planes should have landed status' do 
    six_planes.each {|plane| airport.land(plane)}
    expect( airport.planes.map {|plane| plane.status} ).not_to include 'flying'
  end

  it 'all planes can take off' do
    six_planes.each {|plane| airport.land(plane)}
    airport.planes.each {|plane| airport.take_off(plane)}
    expect(airport.planes.size).to eq 0
  end

  it 'all flying planes should have flying status' do 
    six_planes.each {|plane| airport.land(plane)}
    airport.planes.each {|plane| airport.take_off(plane)}
    expect( six_planes.map {|plane| plane.status} ).not_to include 'landed'
  end

end