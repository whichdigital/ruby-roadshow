require "spec_helper"

describe Darts::Multiplier do

  it "returns 1 by default" do
    expect(subject.for("10")).to eq(1)
  end

  it "returns 3 if the line starts with 'triple'" do
    expect(subject.for("triple 10")).to eq(3)
  end

  it "returns 2 if the line starts with 'triple'" do
    expect(subject.for("double 10")).to eq(2)
  end

end
