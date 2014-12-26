class Tree::Parser
  def self.parse(string)
    new(string).parse
  end

  def initialize(string)
    @string = string
  end

  def parse
    strip_comments
    root = words.first
    Tree.new(node_for(root))
  end

  private

  attr_reader :string

  def strip_comments
    string.gsub!(/#[^\n]*/, "")
  end

  def node_for(word)
    children = relationships[word] || []

    Tree::Node.new(word[:word]).tap do |node|
      node.children = children.map do |child|
        node_for(child)
      end
    end
  end

  def relationships
    @relationships ||= edges.each.with_object({}) do |edge, hash|
      parent = parent_for(edge)
      child = child_for(edge)

      raise_if_missing(edge, parent, child)

      hash[parent] ||= []
      hash[parent] << child
    end
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

  def raise_if_missing(edge, parent, child)
    if parent && child
      return
    elsif parent
      err = "Could not find the child of '#{parent[:word]}'"
    elsif child
      err = "Could not find the parent of '#{child[:word]}'"
    else
      err = "Could not find the parent or child"
    end

    err += " for the edge '#{edge[:word]}' at (#{edge[:x]},#{edge[:y]})"
    raise InvalidInputError, err
  end

  class InvalidInputError < StandardError; end
end
