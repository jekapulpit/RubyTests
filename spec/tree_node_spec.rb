require 'RSpec'
require '../lib/bynary_tree'

RSpec.describe TreeNode do
  let(:node1) { TreeNode.new(1) }
  let(:node2) { TreeNode.new(2) }
  let(:node3) { TreeNode.new(3) }
  let(:node4) { TreeNode.new(4) }
  let(:node5) { TreeNode.new(5) }

  context 'check getting properties' do
    it 'get val from node' do
      expect(node1.val).to eq(1)
    end

    it 'set and return the left node' do
      node1.left = node2
      expect(node1.left).to eq(node2)
    end
  end

  context '1 element tree' do
    it { expect(TreeNode.binary_tree_paths(node1)).to eq(['1 ']) }
  end

  context 'when tree is filled' do
    it 'check the ways' do
      node1.left  = node2
      node2.left  = node3
      node3.right = node4
      node1.right = node5
      expect(TreeNode.binary_tree_paths(node1)).to eq(['1 5 ', '1 2 3 4 '])
    end
  end
end
