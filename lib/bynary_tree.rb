class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def self.binary_tree_paths(node, str = '', fullstr = [])
    str += node.val.to_s + ' '
    if !node.left && !node.right
      fullstr.push(str)
      fullstr
    elsif !node.left && node.right
      binary_tree_paths(node.right, str, fullstr)
    elsif node.left && !node.right
      binary_tree_paths(node.left, str, fullstr)
    else
      binary_tree_paths(node.right, str, fullstr)
      binary_tree_paths(node.left, str, fullstr)
    end
  end
end
