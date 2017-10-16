require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma_ver1'

class EnigmaTest < MiniTest::Test

  def test_can_access_key_rotations
    enigma = Enigma.new
    assert_equal [12,23,34,45], enigma.key_rotations
  end

  def test_can_access_date_offsets
    enigma = Enigma.new
    assert_equal [4,2,8,9], enigma.offset
  end

  def test_can_sum_key_rotations_and_offsets
    enigma = Enigma.new
    assert_equal [16,25,42,54], enigma.rotations
  end

  def test_encrypyt_single_letter
    enigma = Enigma.new
    assert_equal "q", enigma.encrypt("a")
  end

  def test_encrypt_sentence
    enigma = Enigma.new
    assert_equal "x3>g4etr4$>?", enigma.encrypt("Hello, world")
  end

  def test_decryption
    enigma = Enigma.new
    assert_equal "hello, world", enigma.decrypt("x3>g4etr4$>?")
  end

end
