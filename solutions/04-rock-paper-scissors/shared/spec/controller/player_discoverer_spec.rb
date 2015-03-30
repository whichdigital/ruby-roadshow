require "spec_helper"
require "controller"
require "players/player"
require "players/rocky"

RSpec.describe Controller::PlayerDiscoverer do

  it "discovers players in the players/ directory" do
    expect(described_class.players).to include(Rocky)
  end

end
