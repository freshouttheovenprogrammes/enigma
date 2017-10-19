require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test

  def test_that_key_generators_class_exists
    key_generator = KeyGenerator.new("22667")

    assert_instance_of KeyGenerator, key_generator
  end

  def test_is_generating_random_key_of_five_digits
    key_generator = KeyGenerator.new(0)
    result = key_generator.value

    assert_equal 5, result.length
  end

  def test_key_can_accept_user_input
    key_generator = KeyGenerator.new("12345")

    assert_equal "12345", key_generator.value
  end

  def test_that_can_get_rotation_from_key
    key_generator = KeyGenerator.new("12345")
    result = key_generator.get_rotations_from_key

    assert_equal [12, 23, 34, 45], result
  end

  def test_that_it_can_use_random_keygen_in_rotation
    key_generator = KeyGenerator.new(0)
    result = key_generator.get_rotations_from_key

    assert_equal 4, key_generator.rotations.count
  end

end
