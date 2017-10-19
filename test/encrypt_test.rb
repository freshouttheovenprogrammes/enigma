require './test/test_helper'
require './lib/encrypt'
require 'yymmdd'

class EncryptTest < MiniTest::Test
  include YYMMDD

  def test_that_encrypt_class_exists
    encrypt = Encrypt.new("Hey", "12345", Date.today)

    assert_instance_of Encrypt, encrypt
  end

  def test_can_sum_key_rotations_and_offsets
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.rotations

    assert_equal [16,25,42,54], result
  end

  def test_can_get_offsets_from_date
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.offset

    assert_equal [4,2,8,9], result
  end

  def test_can_get_rotations_from_key
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.key_rotations

    assert_equal [12,23,34,45], result
  end

  def test_encrypt_receives_a_message
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.message

    assert_equal "Hello", result
  end

  def test_final_encryption_rotates_correctly
    encrypt = Encrypt.new("a", "12345", Date.today)
    result = encrypt.final_encryption

    assert_equal "q", result

    encrypt2 = Encrypt.new("a", "00000", Date.today)
    result = encrypt2.final_encryption

    assert_equal "e", result
  end

  def test_that_rotation_station_moves_across_character_map
    encrypt = Encrypt.new("lee", "12345", Date.today)
    result = encrypt.rotation_station("l", 0)

    assert_equal "1", result
  end
end
