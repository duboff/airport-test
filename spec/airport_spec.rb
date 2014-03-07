require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) {Plane.new}

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
      airport.take_off(plane)
      expect(plane).to be_flying
    end
  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full ' do
     airport.capacity.times { airport.land(Plane.new) }
     expect( lambda { airport.land(plane)} ).to raise_error(RuntimeError)
    end
    
  #   # Include a weather condition using a module.
  #   # The weather must be random and only have two states "sunny" or "stormy".
  #   # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
  #   # 
  #   # This will require stubbing to stop the random return of the weather.
  #   # If the airport has a weather condition of stormy,
  #   # the plane can not land, and must not be in the airport
  #   context 'weather conditions' do
  #     it 'a plane cannot take off when there is a storm brewing' do
  #     end
      
  #     it 'a plane cannot land in the middle of a storm' do
  #     end

  #   end
  end
end