module RH
  class Roll < Entity

    def initialize(attrs={})
      @dice = attrs[:dice]
      @result = @dice.map do |dice_color|
        dice_result[dice_color].sample
      end
    end

    def dice_result()
      # M = Meat, P = Paw, B = Blast
      {
        'G' => %w{M M M P P B},
        'Y' => %w{M M P P B B},
        'R' => %w{M P P B B B}
      }
    end

  end
end
