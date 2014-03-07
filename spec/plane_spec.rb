require 'plane'

describe Plane do
 
  let(:plane) { Plane.new }
  
  it 'has a flying status when created' do
    expect(plane).to be_flying
  end
  
  it 'has a flying status only when in the air' do
    plane.land
    expect(plane).not_to be_flying
  end
  
  it 'can take off' do
    expect(plane).to respond_to(:take_off)
  end
  
  it 'changes its status to flying after taking of' do
    plane.land
    plane.take_off
    expect(plane).to be_flying
  end

end