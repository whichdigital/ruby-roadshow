require 'spec_helper'
require 'game'
require 'players/player'

RSpec.describe Game do

  let(:player_1) { Player.new(name: 'Flab', colour: 'red') }
  let(:player_2) { Player.new(name: 'Flob', colour: 'blue') }
  subject { described_class.set_players(player_1, player_2) }

  describe '#set_players' do
    it { expect(subject.player_1).to eq player_1 }
    it { expect(subject.player_2).to eq player_2 }
    it { expect(subject.rounds).to eq 100 }
  end
end