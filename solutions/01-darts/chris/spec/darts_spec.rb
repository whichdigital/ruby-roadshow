require "spec_helper"

describe Darts do

  it "calculates the total for a simple input" do
    total = described_class.calculate("
      10
      20
      15
    ")

    expect(total).to eq(45)
  end

  it "calculates the total for the example input" do
    total = described_class.calculate("
      5
      double 10
      triple 20
      25
      double 17
      50
    ")

    expect(total).to eq(194)
  end

end
