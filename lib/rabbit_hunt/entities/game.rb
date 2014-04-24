module RH
  class Game < Entity
    attr_accessor :id, :players, :winner, :turns, :dice_cup

    def initialize(attrs={})
      @turns = []
      super(attrs)
    end

  end
end
