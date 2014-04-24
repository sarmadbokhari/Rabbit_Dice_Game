class Dice
  attr_accessor :value
  def initialize
    @value = rand(6) + 1
  end
end
