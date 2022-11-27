
class Node 
  def initialize(children = {}, value) 
    @children = initialize_children
    @value = value
  end
  
  attr_accessor :children, :value, is_last_char

  private

  def initialize_children
    [].inject({}) { |object, value| object[value] = nil; object }
  end
end