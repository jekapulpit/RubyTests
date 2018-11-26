require 'RSpec'
require '../lib/array_mover'

RSpec.describe ArrayMover do
  let(:array_of_3) { [1, 2, 3] }
  let(:array_of_1) { [1] }
  let(:array_of_5) { [1..5] }

  context 'array of 3 items' do
    it 'return same array' do
      expect(ArrayMover.move(array_of_3, 3)).to eq(array_of_3)
    end

    it 'one left shift' do
      expect(ArrayMover.move(array_of_3, 2)).to eq([2, 3, 1])
    end
  end

  context 'array of 5 items' do
    it 'three left shift' do
      expect(ArrayMover.move(array_of_5, 8)).to eq([4, 5, 1, 2, 3])
    end
  end

  context 'array of 1 item' do
    it { expect(ArrayMover.move(array_of_1, 5)).to eq(array_of_1) }
  end
end
