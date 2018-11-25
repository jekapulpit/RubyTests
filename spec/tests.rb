require 'RSpec'
require '../lib/array_mover'


RSpec.describe Array_mover do
  it 'returns same' do
    expect(Array_mover.move([1,2,3], 3)).to eq([1,2,3])
  end
  it 'returns one left move' do
    expect(Array_mover.move([1,2,3], [1,2,3].length-1)).to eq([2,3,1])
  end
  it 'returns array of 1 el' do
    expect(Array_mover.move([1], 5)).to eq([1])
  end
  it 'returns 3 moves' do
    expect(Array_mover.move([1,2,3,4,5], 8)).to eq([4,5,1,2,3])
  end
end