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
    assert_equal "", crack.get_difference_last_4_characters_index_in_char_map
  end

  def test_negative_correction
    crack = Crack.new("13*6>3:?>d")
    assert_equal 54, crack.negative_correction(-5)
  end

  def test_blerg
    skip
    crack = Crack.new("hx2!7x.f7/")
    assert_equal "", crack.zip_the_arrays_together
  end

  def test_put_rotations_in_order
    crack = Crack.new("6u]m|ua.|>")
    assert_equal "", crack.put_rotations_in_order
  end

  def test_can_crack_a_message
    crack = Crack.new("[6[k1<oce9nt5f5m,[rbe(ug&frl98z?z0l")
    assert_equal "lee..end..", crack.output
  end

  #failed: [.ypq.7@ql  &&  hx2!7x.f7/
  #failed: zp.l.pb .)  &&  5a$.?a.r?7
  #failed: !!$:g!.vgn  &&  :.r$w.0iwl
  #failed: .r2)er.oe]
end
