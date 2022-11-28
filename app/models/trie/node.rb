
class Node 
  def initialize(frequency, value)
    @frequency = frequency
    @value = value 
    @children = initialize_children
    @prefixes = []
    @is_last_node = false
  end
  
  attr_accessor :children, :value, :is_last_node, :prefixes

  def get_all_words
    get_words(self)
  end

  private

  def get_words(child)

    return [] if !child || child.is_last_node

    child.children.values.map do |child|
      get_words(child) << child.value
    end.flatten
  end

  def initialize_children
    ALPHABETS.inject({}) { |object, value| object[value] = nil; object }
  end
end