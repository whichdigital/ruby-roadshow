class Tree

  attr_reader :root

  def self.parse(string)
    Parser.parse(string)
  end

  def initialize(root)
    @root = root
  end
end
