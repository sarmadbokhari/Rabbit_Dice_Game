module RH
  class Roll < Entity
    attr_reader :results

    def initialize(attrs={})
      @dice = attrs[:dice]
      @result = @dice.map do |dice_color|
        type = dice_result[dice_color].sample
        Die.new :type => type, :color => dice_color
      end
    end

    def dice_result()
      # M = Meat, P = Paw, B = Blast
      {
        'green'  => %w{meat meat meat paws paws blast},
        'yellow' => %w{meat meat paws paws blast blast},
        'red'    => %w{meat paws paws blast blast blast}
      }
    end

  end
end
