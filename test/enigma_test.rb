require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/enigma_ver1'

class EnigmaTest < MiniTest::Test

  def test_last_four_digits_from_date_squared
    enigma = Enigma.new
    result = enigma.date_squared_last_four_digits
    assert_equal "4289", result
  end

  def test_add_offset_from_date_to_rotations_abcd
    enigma = Enigma.new
    result = enigma.add_offsets_from_date
    assert_equal [16, 25, 42, 54], enigma.rotations
  end

  # ^ seperate these tests more (per spec)

  def test_encrypyt_single_letter
    skip
    enigma = Enigma.new
    enigma.get_rotations_from_key
    enigma.add_offsets_from_date

    assert_equal "", enigma.encrypt("a")
  end

  def test_encrypt_sentence
    skip
    enigma = Enigma.new
    enigma.get_rotations_from_key
    enigma.add_offsets_from_date

    assert_equal "", enigma.encrypt("Hello my name is Lee Chow.")
  end

end
