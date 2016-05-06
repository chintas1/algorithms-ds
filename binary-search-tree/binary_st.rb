require 'pry-byebug'
class Node
  attr_accessor :value, :parent, :left_child, :right_child
  def initialize(value)
    @value = value
  end
end

class BinaryTree
  attr_accessor :root
  def initialize(root_node = nil)
    @root = root_node
  end

  def add_node(node, root = nil)
    if self.root.nil?
      self.root = node
    elsif (node.value <= root.value)
      if root.left_child 
        self.add_node(node, root.left_child)
      else
        root.left_child = node
        node.parent = root
      end
    else
      if root.right_child 
        self.add_node(node, root.right_child)
      else
        root.right_child = node
        node.parent = root
      end
    end
  end

  def dfs(target_value)
    return self.root if self.root.value == target_value
    stack = [self.root]
    until(stack.empty?)
      node = stack.pop
      return node if node.value == target_value
      if(target_value > node.value)
        stack.push(node.right_child) if node.right_child
      else
        stack.push(node.left_child) if node.left_child
      end
    end
  end

  def dfs_recursive(target_value, node = self.root)
    return node if node.value == target_value
    if(target_value < node.value)
      left_search = dfs_recursive(target_value, node.left_child) if node.left_child
      return left_search if left_search
    else
      right_search = dfs_recursive(target_value, node.right_child) if node.right_child
    end
  end

  def bfs(target_value)
    return self.root if self.root.value == target_value
    queue = [self.root]
    until(queue.empty?)
      node = queue.shift
      return node if node.value == target_value
      queue.push(node.left_child) if node.left_child
      queue.push(node.right_child) if node.right_child
    end
  end
end

def build_tree(arr)
  bin_tree = BinaryTree.new
  arr.each do |num|
    node = Node.new(num)
    bin_tree.add_node(node, bin_tree.root)
  end
  bin_tree
end


#tests
array = [10,3,2,6,20,15,11]
bin_tree = build_tree(array)
debugger
puts 'End.'