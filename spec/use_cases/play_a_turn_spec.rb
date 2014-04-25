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
  end

  describe 'Rolling' do

    before do
      expect(game.dice_cup.dice_count).to eq 13
      expect(game.turns.last.rolls.count).to eq 0

      expect(result.success?).to eq true
      @game = result.game
    end

    it "adds a roll to the current turn" do
      expect(result.success?).to eq true
      turn = @game.turns.last
      expect(turn.rolls.count).to eq 1
    end

    it "subtracts the roll from the dice cup" do
      expect(@game.dice_cup.dice_count).to eq 10
    end

    it "adds a roll with valid results" do
      roll = @game.turns.last.rolls.last
      expect(roll.results.count).to eq(3)

      die = roll.results.first
      expect(die).to be_a RH::Die
      expect(die.color).to match /^green|yellow|red$/
      expect(die.type).to match /^meat|paws|blast$/
    end
  end

end
