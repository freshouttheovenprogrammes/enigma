require './test/test_helper'
require './lib/decrypt'
require 'yymmdd'

class DecryptTest < MiniTest::Test

  include YYMMDD

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


end
