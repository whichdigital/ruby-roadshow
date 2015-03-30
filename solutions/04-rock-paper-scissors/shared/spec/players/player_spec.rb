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
    it "is what the player says when wins" do
      expect(subject.winner).to eq("Bob wins!")
    end
  end

  describe "#loser" do
    it "is what the player says when looses" do
      expect(subject.loser).to eq("Bob looses!")
    end
  end

end