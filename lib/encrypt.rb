require './lib/offset'
require './lib/key'
require 'yymmdd'

class Encrypt
  include YYMMDD

  attr_reader :message,
              :key,
              :date,
              :key_rotations,
              :offset,
              :rotations

  def initialize(message, key, date)
    @character_map = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o',
      'p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7',
      '8','9',' ','.',',','!','@','#','$','%','^','&','*','(',')','[',']','.','<',
      '>',';',':','/','?','|']
    @message = message
    @key = KeyGenerator.new(key)
    @date = DateOffset.new(date)
    @key_rotations = @key.rotations
    @offset = @date.offset
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

  def final_encryption
    encryption = @message.split("")
    encryption.map.with_index do |letter, index|
      rotation_station(letter, index, @character_map)
    end.join
  end

  def rotation_station(letter, index, character_map)
    rotation = @rotations[index % 4]
    new_index = character_map.index(letter.downcase) + rotation
    character_map[new_index % character_map.length]
  end

  def text_reader
    #move outside class
    text_in = ARGV[0]
    text_out = ARGV[1]
    input_message = File.open(text_in, "r").read.chomp
    #chomp was important because of \ character not being in map
    encrypt = Encrypt.new(input_message, 0, Date.today)
    encrypted_message = encrypt.final_encryption
    output_message = File.open(text_out, "w").write(encrypted_message)
  end

end

encrypt = Encrypt.new("", 0, Date.today)
encrypt.text_reader
puts "Created '#{ARGV[1]}' with the key #{encrypt.key.value} and date #{Date.today}"
