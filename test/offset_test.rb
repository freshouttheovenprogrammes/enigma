require './test/test_helper'
require './lib/offset'

class DateOffsetTest < MiniTest::Test

  def test_date_offset_class_exists
    date = DateOffset.new

    assert_instance_of DateOffset, date
  end

  def test_last_four_digits_from_date_squared
    date = DateOffset.new(Date.today)
    result = date.date_squared_last_four_digits

    assert_equal "4289", result
  end

  def test_that_offset_array_is_updated
    date = DateOffset.new(Date.today)
    
    assert_equal [4, 2, 8, 9], date.get_offsets
  end
end
