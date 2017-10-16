require 'pry'
require './lib/key'
require './lib/offset'

class Enigma
  attr_reader :key,
              :date,
              :rotations,
              :offset,
              :key_rotations

  def initialize (key = KeyGenerator.new("12345"), date = DateOffset.new)
    @key = key.value
    @date = date
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
      'p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7',
      '8','9',' ','.',',','!','@','#','$','%','^','&','*','(',')','[',']','.','<','>',';',':','/','?',
      '|']
    @key_rotations = key.rotations
    @offset = date.offset
    @rotations = add_key_rotations_and_offset
  end

  def add_key_rotations_and_offset
    rotations = []
    rotations[0] = @key_rotations[0] + @offset[0]
    rotations[1] = @key_rotations[1] + @offset[1]
    rotations[2] = @key_rotations[2] + @offset[2]
    rotations[3] = @key_rotations[3] + @offset[3]
    return rotations
  end

  def rotation_station(letter, index, character_map)
    rotation = @rotations[index % 4]
    new_index = character_map.index(letter.downcase) + rotation
    character_map[new_index % character_map.length]
  end

  def encrypt(message, key = @key, date = @date)
    encryption = message.split("")
    encryption.map.with_index do |letter, index|
      rotation_station(letter, index, @character_map)
    end.join
  end

  def decrypt(message, key = @key, date = @date)
    reverse_map = @character_map.reverse
    decryption = message.split("")
    decryption.map.with_index do |letter, index|
      rotation_station(letter, index, reverse_map)
    end.join
  end

  # .zip refactor to combine arrays for cracking.
  #make separate runner file

end
