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
  end
end
