require "spec_helper"
require "./lib/players/player"
require "./lib/players/rocky"

RSpec.describe Player do
  subject { Rocky.new(name: "Bob", colour: "#F00") }

  describe "#choice" do

    it "is 80% rock" do
      allow(Kernel).to receive(:rand).and_return(0, 1, 2, 3, 4, 5, 6, 7, 8, 9)
      choices = (0...10).to_a.map { subject.choice }
      expect(choices.count(:rock)).to eq 8
    end
  end

end