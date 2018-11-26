require 'RSpec'
require '../lib/array_mover'
RSpec.describe Array_mover do
  let(:array_of_3) { [1, 2, 3] }
  let(:array_of_1) { [1] }
  let(:array_of_5) { [1, 2, 3, 4, 5] }

  context 'returns same' do
    it { expect(Array_mover.move(array_of_3, 3)).to eq([1, 2, 3]) }
  end

  context 'returns one left move' do
    it { expect(Array_mover.move(array_of_3, array_of_3.length - 1)).to eq([2, 3, 1]) }
  end

  context 'returns array of 1 el' do
    it { expect(Array_mover.move(array_of_1, 5)).to eq(array_of_1) }
  end

  context 'returns 3 moves' do
    it { expect(Array_mover.move(array_of_5, 8)).to eq([4, 5, 1, 2, 3]) }
  end
end
