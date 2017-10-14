require 'pry'
# require './lib/key'

class Enigma
  attr_reader :key, :date, :message

  def initialize(message, key = generate_random_key, date = 131017)
    @message = message
    @key = key
    @date = date
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']
    @a = 0
    @b = 0
    @c = 0
    @d = 0
  end

  def generate_random_key
    digits = []
    5.times do
      digits << rand(10)
    end
    digits.join
  end

  def get_rotations_from_key
    @a = key[0..1].to_i
    @b = key[1..2].to_i
    @c = key[2..3].to_i
    @d = key[3..4].to_i
    test_array = [@a, @b, @c, @d]
  end

  def add_offsets_from_date
    @a += date_squared_last_four_digits[0].to_i
    @b += date_squared_last_four_digits[1].to_i
    @c += date_squared_last_four_digits[2].to_i
    @d += date_squared_last_four_digits[3].to_i
    test_array = [@a, @b, @c, @d]
  end

  def date_squared_last_four_digits
    (date * date).to_s[-4..-1]
  end

  def encrypt(message)
    # message.split("").map do |character|
    #   if @character_map.include?(character.downcase)
    #     new_index = @character_map.index(character) + @a
    #     @character_map[new_index]
    #   end
    # end

    first_4_characters = message.split("").shift(4)

    first_4_characters.map do |character|
      if @character_map.include?(character.downcase)
        new_index = @character_map.index(character.downcase) + @a
        @character_map[new_index]
      end
    end.join

    #use %4 and then assign the rotation amount (current state) to a,b,c,d



  end

  # def encrypt(message, key, date)
    #will need to initialize Key here (use separate Key class file)
    #also will need to initialize date in here instead of in the Enigma class
  # end

end
