require 'spec_helper'

describe RH::Databases::InMemory do
  let(:db) { RH.db }

  it "creates a game" do
    game = db.create_game :players => ['Alice', 'Bob', 'Carl']

    expect(game.players).to include('Alice', 'Bob', 'Carl')
    expect(game.winner).to be_nil
    expect(game.dice_cup).to be_a RH::DiceCup

    expect(game.turns.count).to eq 1
    expect(game.turns.first.player).to match /^Alice|Bob|Carl$/
    expect(game.turns.first.rolls.count).to eq 0
  end

  it "gets a game" do
    created_game = db.create_game :players => ['John', "Jacob"]
    game = db.get_game(created_game.id)

    expect(game.players).to include('John', 'Jacob')
    expect(game.winner).to be_nil
    expect(game.dice_cup).to be_a RH::DiceCup

    expect(game.turns.count).to eq 1
    expect(game.turns.first.player).to match /^John|Jacob$/
    expect(game.turns.first.rolls.count).to eq 0
  end

end
