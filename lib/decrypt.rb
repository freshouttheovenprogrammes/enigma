require 'yymmdd'
require './lib/offset'
require './lib/key'

class Decrypt
  include YYMMDD

  attr_reader :message, :date, :key_rotations, :offset, :rotations

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
    for index in 0..3
      rotations[index] = @key_rotations[index] + @offset[index]
    end
    # rotations[0] = @key_rotations[0] + @offset[0]
    # rotations[1] = @key_rotations[1] + @offset[1]
    # rotations[2] = @key_rotations[2] + @offset[2]
    # rotations[3] = @key_rotations[3] + @offset[3]
    return rotations
  end

  def final_decryption
    reverse_map = @character_map.reverse
    decryption = message.split("")
    decryption.map.with_index do |letter, index|
      rotation_station(letter, index, reverse_map)
    end.join
  end

  def rotation_station(letter, index, character_map)
    rotation = @rotations[index % 4]
    new_index = character_map.index(letter.downcase) + rotation
    character_map[new_index % character_map.length]
  end
end

if ARGV.empty? == false
  date = Date.today
  message = File.open(ARGV[0], 'r').read.chomp
  decrypt = Decrypt.new(message, ARGV[2], date)
  decrypted_message = decrypt.final_decryption
  output_file = File.open(ARGV[1], "w").write(decrypted_message)
  puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{date}"
end
