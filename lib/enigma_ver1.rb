require 'pry'
require '../lib/key'
require '../lib/offset'


class Enigma


  attr_reader :key, :date, :rotations, :offset

  def initialize (key = KeyGenerator.new("12345") date = DateOffset.new)
    @key = key.key #rename to value on refactor
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
      'p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7',
      '8','9',' ','.',',','!','@','#','$','%','^','&','*','(',')','[',']','.','<','>',';',':','/','?',
      '|']
    @keyrotations = key.rotations
    @offset = date.offset
    @rotations = rotations
  end

# .zip refactor to combine arrays for cracking.
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

end


  # will need to initialize Key here (use separate Key class file)
  # also will need to initialize date in here instead of in the Enigma class
  #maybe make @character_map * 3 so that doesn't have to re-cycle over array. or find method that will do that.
