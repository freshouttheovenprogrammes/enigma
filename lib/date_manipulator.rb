class Whatever

  def date_squared_last_four_digits
    (date * date).to_s[-4..-1]
  end

end
