module RH
  module Databases
    class InMemory

      def initialize
        @games = {}
      end

      def create_game(attrs)
        game = Game.new(:players => attrs[:players], :dice_cup => RH::DiceCup.new )
        @games[game.id] = game

        starting_player = game.players.sample

        starting_turn = Turn.new(:game_id => game.id, :player => starting_player)
        game.turns.push(starting_turn)

        game
      end

      def get_game(id)
        @games[id]
      end

    end
  end
end
