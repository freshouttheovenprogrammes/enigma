require 'pry'

class KeyGenerator

  attr_reader :key, :rotations

  def initialize(key = generate_random_key)
    # @rotator = rotator
    @key       = key
    @a         = 0
    @b         = 0
    @c         = 0
    @d         = 0
    @rotations = get_rotations_from_key
  end

  def generate_random_key
    digits = []
    5.times do
      digits << rand(0..9)
    end
    digits.join
  end

=begin
maybe use gets.chomp for xxxtra badassery
=end

  def get_rotations_from_key
    @a = key[0..1].to_i
    @b = key[1..2].to_i
    @c = key[2..3].to_i
    @d = key[3..4].to_i
    @rotations = [@a, @b, @c, @d]
  end

end
