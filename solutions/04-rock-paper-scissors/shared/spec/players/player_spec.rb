require "spec_helper"
require "./lib/players/player"

RSpec.describe Player do
  subject { Player.new(name: "Bob", colour: "#F00") }

  describe "#choice" do
    it "is either rock paper or scissors" do
      expect([:rock, :paper, :scissors]).to include(subject.choice)
    end
  end

  describe "#winner" do
    it "is not implemented" do
      expect{subject.winner}.to raise_error
    end
  end

  describe "#loser" do
    it "is not implemented" do
      expect{subject.loser}.to raise_error
    end
  end

end