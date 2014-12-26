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

  def ancestors
    Enumerator.new do |y|
      if parent
        y.yield(parent)
        parent.ancestors.each { |a| y.yield(a) }
      end
    end
  end

  protected

  attr_writer :parent

end
