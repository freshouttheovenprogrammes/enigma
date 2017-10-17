require './lib/offset'
require './lib/key'
require 'yymmdd'
require 'pry'

class Crack
  include YYMMDD

  attr_reader :message,
              :date,
              :offset,
              :rotations,
              :output

  def initialize(message, date = Date.today)
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
      'p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7',
      '8','9',' ','.',',','!','@','#','$','%','^','&','*','(',')','[',']','.','<',
      '>',';',':','/','?','|']
    @message = message
    @rotations = put_rotations_in_order
    @output = final_decryption
  end

  def get_last_4_characters_indices_modulo_4
    message.split("").map.with_index do |letter, index|
      index % 4
    end[-4..-1]
  end

  def get_difference_last_4_characters_index_in_char_map
    differences_in_indices = []
    # @character_map.index(message[-7]) - @character_map.index(".")
    # @character_map.index(message[-6]) - @character_map.index(".")
    # @character_map.index(message[-5]) - @character_map.index("e")
    differences_in_indices << @character_map.index(message[-4]) - @character_map.index("n")
    differences_in_indices << @character_map.index(message[-3]) - @character_map.index("d")
    differences_in_indices << @character_map.index(message[-2]) - @character_map.index(".")
    differences_in_indices << @character_map.index(message[-1]) - @character_map.index(".")
  end

  def zip_the_arrays_together
    @rotations = get_last_4_characters_indices_modulo_4.zip(get_difference_last_4_characters_index_in_char_map).sort
  end

  def put_rotations_in_order
    zip_the_arrays_together
    @rotations[0] = @rotations[0][1]
    @rotations[1] = @rotations[1][1]
    @rotations[2] = @rotations[2][1]
    @rotations[3] = @rotations[3][1]
    @rotations
  end

  def final_decryption
    reversed_map = @character_map.reverse
    decryption = message.split("")
    decryption.map.with_index do |letter, index|
      rotation_station(letter, index, reversed_map)
    end.join
  end

  def rotation_station(letter, index, reversed_map)
    rotation = @rotations[index % 4]
    new_index = reversed_map.index(letter.downcase) + rotation
    reversed_map[new_index % reversed_map.length]
  end

end
