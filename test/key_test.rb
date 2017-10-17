require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def test_key_can_accept_user_input
    key_generator = KeyGenerator.new("12345")
    assert_equal "12345", key_generator.value
  end

  def test_is_generating_random_key_of_five_digits
    key_generator = KeyGenerator.new(0)
    result = key_generator.value
    assert_equal 5, result.length
  end

  def test_that_can_get_rotation_from_key
    key_generator = KeyGenerator.new("12345")
    result = key_generator.get_rotations_from_key
    assert_equal [12, 23, 34, 45], result
  end



end
