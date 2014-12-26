class Tree::Parser
  def self.parse(string)
    new(string).parse
  end

  def initialize(string)
    @string = string
  end

  def parse
    nodes = relationships.map do |parent, children|
      node = Tree::Node.new(parent[:word])
      node.children = children.map do |child|
        Tree::Node.new(child[:word])
      end
      node
    end

    Tree.new(nodes.first)
  end

  private

  attr_reader :string

  def relationships
    hash = {}
    words.each { |w| hash[w] = [] }
    edges.each do |edge|
      parent = parent_for(edge)
      hash[parent] ||= []
      hash[parent] << child_for(edge)
    end
    hash
  end

  def words
    @_words ||= words_with_coordinates.reject { |w| edge?(w[:word]) }
  end

  def edges
    @_edges ||= words_with_coordinates.select { |w| edge?(w[:word]) }
  end

  def edge?(word)
    ["/", "\\"].include?(word)
  end

  def words_with_coordinates
    @_words_with_coordinates ||= (
      @word = []
      indexed_lines.each do |line, y|
        indexed_chars(line).each do |char, x|
          if whitespace?(char)
            end_of_word
          else
            @word << { word: char, x: x, y: y }
          end
        end
        end_of_word
      end
      end_of_word
      @words
    )
  end

  def end_of_word
    @words ||= []
    @words << @word.reduce { |a, b| a[:word] << b[:word]; a } if @word.any?
    @word = []
  end

  def indexed_lines
    lines.each.with_index
  end

  def lines
    string.split("\n")
  end

  def indexed_chars(line)
    chars(line).each.with_index
  end

  def chars(line)
    line.split("")
  end

  def whitespace?(char)
    char == " "
  end

  def parent_for(edge)
    word_at_coordinate(edge[:x] + offset(edge), edge[:y] - 1)
  end

  def child_for(edge)
    word_at_coordinate(edge[:x] - offset(edge), edge[:y] + 1)
  end

  def offset(edge)
    edge[:word] == "/" ? 1 : -1
  end

  def word_at_coordinate(x, y)
    words.detect do |w|
      start_x = w[:x]
      end_x = w[:x] + w[:word].length - 1

      (start_x..end_x).include?(x) && w[:y] == y
    end
  end

end
