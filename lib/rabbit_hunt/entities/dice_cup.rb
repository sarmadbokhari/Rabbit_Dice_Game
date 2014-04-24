module RH
  class DiceCup < Entity

    def initialize(attrs={})
      @dice = []

      6.times { @dice.push 'G' }
      4.times { @dice.push 'Y' }
      3.times { @dice.push 'R' }
    end

    def dice_count
      @dice.count
    end

    def roll
      @dice.sort_by! { rand(@dice.count) }
      Roll.new :dice => 3.times.map { @dice.pop }
    end

  end
end
