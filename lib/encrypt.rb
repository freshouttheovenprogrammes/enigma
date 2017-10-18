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
end

input_filename = ARGV[0]
output_filename = ARGV[1]
message = File.open(input_filename, 'r').read.chomp
encrypt = Encrypt.new(message, "82648", Date.today)
encrypted_message = encrypt.final_encryption
output_file = File.open(output_filename, "w").write(encrypted_message)
puts "Created '#{ARGV[1]}' with the key #{encrypt.key.value} and date #{Date.today}"
