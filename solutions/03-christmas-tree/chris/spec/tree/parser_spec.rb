require "spec_helper"

describe Tree::Parser do

  it "parses degenerate trees" do
    tree = described_class.parse("root")
    expect(tree.root.value).to eq("root")
  end

  it "parses trivial trees" do
    tree = described_class.parse('
            root
           /    \
        child1  child2
    ')

    root = tree.root
    expect(root.value).to eq("root")

    expect(root.children.first.value).to eq("child1")
    expect(root.children.last.value).to eq("child2")
  end

  it "parses complex trees" do
    tree = described_class.parse('
            root
           /    \
        child1  child2
         /   \
        gc1  gc2
    ')

    root = tree.root
    child1 = root.children.first

    expect(child1.children.first.value).to eq("gc1")
    expect(child1.children.last.value).to eq("gc2")
  end

  it "raises helpful errors if it fails to parse" do
    expect {
      described_class.parse('
            foo
                   \
                   bar
      ')
    }.to raise_error(Tree::Parser::InvalidInputError, /bar/)

    expect {
      described_class.parse('
            foo
              \
                   bar
      ')
    }.to raise_error(Tree::Parser::InvalidInputError, /foo/)

    expect {
      described_class.parse('
            foo
                   \
              bar
      ')
    }.to raise_error(Tree::Parser::InvalidInputError, /parent or child/)
  end

end
