require 'RSpec'
require '../lib/array_mover'
require '../lib/bynary_tree'
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

RSpec.describe TreeNode do

  let(:node) { TreeNode.new(1) }
  let(:leaf1) { TreeNode.new(2) }
  let(:leaf2) { TreeNode.new(3) }
  let(:leaf3) { TreeNode.new(4) }
  let(:leaf4) { TreeNode.new(5) }

  context 'returns value' do
    it { expect(node.val).to eq(1) }
  end

  context 'connecting nodes' do
    it do
      node.left = leaf1
      expect(node.left).to eq(leaf1)
    end
  end

  context 'connecting nodes' do
    it do
      node.left = leaf1
      expect(node.left).to eq(leaf1)
    end
  end

  context '1 element tree' do
    it do
      expect(TreeNode.binary_tree_paths(node)).to eq(['1 '])
    end
  end

  context 'connecting nodes' do
    it do
      node.left = leaf1
      leaf1.left = leaf2
      leaf2.right = leaf3
      node.right = leaf4
      expect(TreeNode.binary_tree_paths(node)).to eq(['1 5 ', '1 2 3 4 '])
    end
  end

end
