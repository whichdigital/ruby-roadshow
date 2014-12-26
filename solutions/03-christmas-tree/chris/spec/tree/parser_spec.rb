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

end
