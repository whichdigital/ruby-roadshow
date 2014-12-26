class Tree

  attr_reader :root

  def self.parse(string)
    Parser.parse(string)
  end

  def initialize(root)
    @root = root
  end

  def breadth_first
    Enumerator.new do |y|
      queue = [root]

      until queue.empty?
        node = queue.shift
        y.yield(node)
        queue += node.children
      end
    end
  end

end
