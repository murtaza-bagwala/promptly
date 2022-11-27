class Tree
  attr_accessor :root

  def insert(key)
    current_node = root
    for index in [0..key.length - 1] do
      node = current_node.children[key[index]]
      if node == nil 
        new_node = Node.new
        node.children[key[index]] = new_node
        current_node = new_node
      else
        current_node = node
      end
    end
  end 

  def root
    @root ||= Node.new
  end
end