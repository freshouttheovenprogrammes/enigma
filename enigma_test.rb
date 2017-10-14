require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < MiniTest::Test
  def test_user_can_enter_key
    enigma = Enigma.new("Hello", "12345", 101317)
    assert_equal "12345", enigma.key
  end

  def test_otherwise_generate_random_key
    skip
    enigma = Enigma.new("Hello")
    assert_equal "", enigma.key
  end

  def test_can_get_rotation_amount_from_key
    enigma = Enigma.new("Hello", "12345")
    assert_equal [12,23,34,45], enigma.get_rotations_from_key
  end

  def test_last_four_digits_from_date_squared
    enigma = Enigma.new("Hello", "12345", 101317)
    assert_equal "4489", enigma.date_squared_last_four_digits
  end

  def test_add_offset_from_date_to_rotations_abcd
    enigma = Enigma.new("Hello", "12345", 101317)
    enigma.get_rotations_from_key

    assert_equal [16,27,42,54], enigma.add_offsets_from_date
  end

  def test_encrypyt_single_letter
    skip
    enigma = Enigma.new("Hello", "12345", 101317)
    enigma.get_rotations_from_key
    enigma.add_offsets_from_date

    assert_equal "", enigma.encrypt("a")
  end

  def test_encrypt_sentence
    enigma = Enigma.new("Hello my name is Lee Chow.", "12345", 101317)
    enigma.get_rotations_from_key
    enigma.add_offsets_from_date

    assert_equal "", enigma.encrypt("Hello my name is Lee Chow.")
  end

end
