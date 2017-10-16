require 'minitest/autorun'
require 'minitest/pride'
require "date"
require "yymmdd"

class DateOffset
  include YYMMDD

  attr_reader :date,
              :offset

  def initialize(date)
    @date = date
    @offset = get_offsets
  end

  def date_squared_last_four_digits
    date = ddmmyy(@date).to_i
    (date ** 2).to_s[-4..-1]
  end

  def get_offsets
    offset = []
    offset[0] = date_squared_last_four_digits[0].to_i
    offset[1] = date_squared_last_four_digits[1].to_i
    offset[2] = date_squared_last_four_digits[2].to_i
    offset[3] = date_squared_last_four_digits[3].to_i
    return offset
  end

end
