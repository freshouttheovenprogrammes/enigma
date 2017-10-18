require './test/test_helper'
require './lib/enigma'
require './lib/crack'

class EnigmaTest < MiniTest::Test

  def test_encrypyt_single_letter
    enigma = Enigma.new
    result = enigma.encrypt("a", "12345", Date.today)
    assert_equal "q", result
  end

  def test_encrypt_sentence
    enigma = Enigma.new
    result = enigma.encrypt("Hello, world", "12345", Date.today)
    assert_equal "x3>g4etr4$>?", result
  end

  def test_decrypt_single_letter
    enigma = Enigma.new
    result = enigma.decrypt("a", "12345", Date.today)
    assert_equal "%", result
  end

  def test_decrypt_sentence
    enigma = Enigma.new
    result = enigma.decrypt("x3>g4etr4$>?", "12345")
    assert_equal "hello, world", result
  end

  def test_encrypt_sentence_with_special_ending
    enigma = Enigma.new
    result = enigma.encrypt("Lee..end..", "12345", Date.today)
    assert_equal "13*6>3:?>d", result
  end

  def test_encrypt_sentence_with_special_ending_random_key
    enigma = Enigma.new
    result = enigma.encrypt("Lee..end..", 0, Date.today)
    assert_equal "", result
  end

  def test_can_crack_a_message
    enigma = Enigma.new
    assert_equal "lee..end..", enigma.crack("6u]m|ua.|>")
  end

  def test_that_it_is_reading_message_file
    skip
    enigma = Enigma.new
    result = enigma.io_reader[0]
    binding.pry
    assert_equal "",""
  end

  def test_that_encrypted_message_is_output_to_new_file
  end

end
