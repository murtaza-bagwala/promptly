class Trie::Tree
  attr_accessor :root

  def insert(word)
    key = word.downcase
    current_node = root

    for index in 0..key.length - 1 do
      node = current_node.children[key[index]]
      if node == nil 
        new_node = Trie::Node.new(0, key[0..index])
        current_node.children[key[index]] = new_node
        current_node = new_node
      else
        current_node = node
      end
    end
    current_node.is_last_node = true;
  end 

  def search(word)
    key = word.downcase
    current_node = root
    for index in 0..key.length - 1 do
      node = current_node.children[key[index]]
      char = key[index]
      if node == nil 
        return []
      else
        current_node = node
      end
    end
    return current_node.get_all_words
  end 

  def root
    @root ||= Trie::Node.new(0, "root")
  end
end