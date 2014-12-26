class Tree::Node

  attr_reader :value, :children, :parent

  def initialize(value)
    @value = value
  end

  def children=(children)
    @children = children.each do |child|
      child.parent = self
    end
  end

  protected

  attr_writer :parent

end
