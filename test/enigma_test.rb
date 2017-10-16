require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

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

  def test_can_find_indices_of_known_tail_sequence
    skip
    #tail sequence of ..end..
    enigma = Enigma.new
    # assert_equal "..end..",
  end

  def test_can_get_key_from_encrypted_message
    skip
    enigma = Enigma.new
    #need to change the key and message later
    assert_equal "34563", enigma.crack("hgkjffkljghfkj")
  end

end
