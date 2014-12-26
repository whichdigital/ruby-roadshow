require "spec_helper"

describe Tree::Node do
  it "initializes with a value object" do
    node = described_class.new("some value")
    expect(node.value).to eq("some value")
  end

  it "has a parent-child hierarchy" do
    parent = described_class.new("parent")
    child  = described_class.new("child")

    parent.children = [child]

    expect(parent.children).to eq([child])
    expect(child.parent).to eq(parent)
  end
end
