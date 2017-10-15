require 'minitest/autorun'
require 'minitest/pride'
require '../lib/enigma_ver1'

class EnigmaTest < MiniTest::Test

  # def test_last_four_digits_from_date_squared
  #   enigma = Enigma.new
  #   result = enigma.date_squared_last_four_digits
  #   assert_equal "4289", result
  # end

  def test_add_offset_from_date_to_rotations_abcd
    enigma = Enigma.new
    result = enigma.add_offsets_from_date
    assert_equal [16, 25, 42, 54], enigma.rotations
  end

  def test_can_access_date_offsets
    enigma = Enigma.new
    assert_equal [4,2,8,9], enigma.offset
  end

  # ^ seperate these tests more (per spec)
  def test_encrypyt_single_letter
    enigma = Enigma.new
    enigma.add_offsets_from_date
    assert_equal "q", enigma.encrypt("a")
  end

  def test_encrypt_sentence
    enigma = Enigma.new
    enigma.add_offsets_from_date
    assert_equal "x3>g4etr4$>?", enigma.encrypt("Hello, world")
  end

  def test_decryption
    enigma = Enigma.new
    enigma.add_offsets_from_date
    assert_equal "hello, world", enigma.decrypt("x3>g4etr4$>?")
  end

end
