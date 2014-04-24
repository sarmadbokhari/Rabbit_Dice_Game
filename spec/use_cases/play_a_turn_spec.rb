require 'spec_helper'

describe RH::PlayTurn do
  let(:game) { RH.db.create_game :players => ['Alice', 'Bob'] }
  let(:result) { described_class.run(@params) }

  before do
    @params = {
      :game_id => game.id,
      :move => 'roll_dice'
    }

    expect(game.turns.count).to eq 1
    game.turns.first.player = 'Alice'
  end

  describe 'Error handling' do
    it 'ensures the game exists' do
      @params[:game_id] = 12345
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_game_id
    end

    it 'ensures the move is valid' do
      @params[:move] = 'instawin'
      expect(result.success?).to eq false
      expect(result.error).to eq :invalid_move
    end

    it "adds a roll to the current turn" do
      expect(game.dice_cup.dice_count).to eq 13

      expect(result.success?).to eq true

      game = result.game
      expect(game.dice_cup.dice_count).to eq 10
      turn = game.turns.last
      expect(turn.rolls.count).to eq 1
    end

  end

end
