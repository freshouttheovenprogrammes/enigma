require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'
require 'yymmdd'

class EncryptTest < MiniTest::Test
  include YYMMDD

  def test_encrypt_receives_a_message
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.message
    assert_equal "Hello", result
  end

  def test_can_get_rotations_from_key
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.key_rotations
    assert_equal [12,23,34,45], result
  end

  def test_can_get_offsets_from_date
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.offset
    assert_equal [4,2,8,9], result
  end

  def test_can_sum_key_rotations_and_offsets
    encrypt = Encrypt.new("Hello", "12345", Date.today)
    result = encrypt.rotations
    assert_equal [16,25,42,54], result
  end

end
