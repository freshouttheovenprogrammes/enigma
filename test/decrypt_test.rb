require './test/test_helper'
require './lib/decrypt'
require 'yymmdd'

class DecryptTest < MiniTest::Test

  include YYMMDD

  def test_that_decrypt_class_exists
    decrypt = Decrypt.new("m", "12345", Date.today)
    assert_instance_of Decrypt, decrypt
  end

  def test_that_it_can_decrypt_sentence
    decrypt = Decrypt.new("x3>g4etr4$>?", "12345", Date.today)
    result = decrypt.final_decryption
    assert_equal "hello, world", result
  end

  def test_that_it_accepts_key_rotations
    decrypt = Decrypt.new("x3>g4etr4$>?", "12345", Date.today)
    result = decrypt.key_rotations
    assert_equal [12, 23, 34, 45], result
  end

  def test_can_sum_key_rotations_and_offsets
    decrypt = Decrypt.new("x3>g4etr4$>?", "12345", Date.today)
    result = decrypt.rotations
    assert_equal [16, 25, 42, 54], result
  end


  def test_that_it_receives_offset_from_date
    decrypt = Decrypt.new("x3>g4etr4$>?", "12345", Date.today)
    result = decrypt.offset
    assert_equal [4, 2, 8, 9], result
  end

  def test_decryption_rotates_correctly
    decrypt = Decrypt.new("q", "12345", Date.today)
    result = decrypt.final_decryption

    assert_equal "a", result

    decrypt2 = Decrypt.new("e", "00000", Date.today)
    result = decrypt2.final_decryption

    assert_equal "a", result
  end

  def test_that_it_rotates_across_the_character_map
    decrypt = Decrypt.new("h", "12355", Date.today)
    result = decrypt.rotation_station("h", 0)

    assert_equal "]", result
  end

end
