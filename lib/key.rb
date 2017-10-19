require 'pry'

class KeyGenerator

  attr_reader :value, :rotations

  def initialize(value)
    @value     = generate_random_key(value)
    @rotations = get_rotations_from_key
  end

  def generate_random_key(value)
    return value unless value == 0
    digits = []
    5.times do
      digits << rand(0..9)
    end
    digits.join
  end

  def get_rotations_from_key
    a = value[0..1].to_i
    b = value[1..2].to_i
    c = value[2..3].to_i
    d = value[3..4].to_i
    @rotations = [a, b, c, d]
  end

end
