require './test/test_helper'
require './lib/crack'

class CrackTest < MiniTest::Test
  def test_find_length_of_encrypted_message
    crack = Crack.new("Hello")

    assert_equal 5, crack.message.length
  end

  def test_can_generate_array_of_indices_modulo_4
    crack = Crack.new("13*6>3:?>d")

    assert_equal [2,3,0,1], crack.get_last_4_characters_indices_modulo_4
  end

  def test_can_get_difference_in_encrypted_vs_decrypted_indices_last_4_characters
    crack = Crack.new("hx2!7x.f7/")

    assert_equal [24, 2, -4, 19], crack.get_difference_last_4_characters_index_in_char_map
  end

  def test_that_arrays_join
    crack = Crack.new("hx2!7x.f7/")

    assert_equal [[0, -4], [1, 19], [2, 24], [3, 2]], crack.zip_the_arrays_together
  end

  def test_put_rotations_in_order
    crack = Crack.new("6u]m|ua.|>")

    assert_equal [21, 16, -13, 34], crack.put_rotations_in_order
  end

  def test_can_crack_a_message
    crack = Crack.new("67.1[8c&5@u1r2bn6evn03v*")

    assert_equal "this is so secret..end..", crack.output
  end

end
