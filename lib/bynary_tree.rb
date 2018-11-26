class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def self.binary_tree_paths (leaf, str = "", fullstr = [])
    str += leaf.val.to_s + ' '
    if !leaf.left and !leaf.right
      fullstr.push(str)
      fullstr
    elsif !leaf.left and leaf.right
      binary_tree_paths(leaf.right, str, fullstr)
    elsif leaf.left and !leaf.right
      binary_tree_paths(leaf.left, str, fullstr)
    else
      binary_tree_paths(leaf.right, str, fullstr)
      binary_tree_paths(leaf.left, str, fullstr)
    end
  end
end
