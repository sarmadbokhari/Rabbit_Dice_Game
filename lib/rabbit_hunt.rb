require_relative 'rabbit_hunt/databases/in_memory.rb'

require_relative 'rabbit_hunt/entity.rb'
require_relative 'rabbit_hunt/entities/game.rb'
require_relative 'rabbit_hunt/entities/turn.rb'
require_relative 'rabbit_hunt/entities/roll.rb'
require_relative 'rabbit_hunt/entities/die.rb'
require_relative 'rabbit_hunt/entities/dice_cup.rb'

require_relative 'rabbit_hunt/use_case.rb'
require_relative 'rabbit_hunt/use_cases/play_a_turn.rb'

module RH
  def self.db
  @__db_instance ||= Databases::InMemory.new
  end
end
