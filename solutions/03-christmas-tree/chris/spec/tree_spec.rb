require "spec_helper"

describe Tree do
  it "works for the example in the readme" do
    tree = Tree.parse('

                  chestnuts
                  /     \
              roasting   on
              /    \       \
            an     open     fire
            / \       \        \
          jack frost   nipping  on
                                / \
                              your nose

    ')

    root = tree.root
    expect(root.value).to eq("chestnuts")

    result = root.children.map do |child|
      child.value
    end
    expect(result).to eq(["roasting", "on"])

    roasting = root.children.first
    result = roasting.children.map do |child|
      child.value
    end
    expect(result).to eq(["an", "open"])
  end

  it "works for extension a in the readme" do
    tree = Tree.parse('

                  chestnuts
                  /     \
              roasting   on
              /    \       \
            an     open     fire
            / \       \        \
          jack frost   nipping  on
                                / \
                              your nose

    ')

    expect(tree.breadth_first).to be_an(Enumerator)

    result = tree.breadth_first.map do |node|
      node.value
    end

    expect(result).to eq %w(chestnuts roasting on an open fire jack frost nipping on your nose)
  end
end
