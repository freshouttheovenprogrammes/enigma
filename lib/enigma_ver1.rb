require 'pry'
require '../lib/key'
require "date"
require "yymmdd"

class Enigma
  include YYMMDD

  attr_reader :key, :date, :rotations

  def initialize(key = KeyGenerator.new("12345"), date = Date.today)
    # @message = message
    @key = key.key #rename to value on refactor
    @date = date
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']
    @rotations = key.rotations
  end

  def date_squared_last_four_digits
    date = ddmmyy(@date).to_i
    (date ** 2).to_s[-4..-1]
  end

  def add_offsets_from_date
    @rotations[0] += date_squared_last_four_digits[-4].to_i
    @rotations[1] += date_squared_last_four_digits[-3].to_i
    @rotations[2] += date_squared_last_four_digits[-2].to_i
    @rotations[3] += date_squared_last_four_digits[-1].to_i
  end
# ^^^^^^^ need to add this as own class (per spec) ^^^^^^



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
  #maybe make @character_map * 3 so that doesn't have to re-cycle over array. or find method that will do that.
end
