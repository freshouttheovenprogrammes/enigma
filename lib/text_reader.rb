require 'pry'
require 'yymmdd'
require './lib/key'
require './lib/offset'
require './lib/encrypt'

include YYMMDD

def text_reader
  text_in = ARGV[0]
  text_out = ARGV[1]
  input_message = File.open(text_in, "r").read.chomp
  #chomp was important because of \ character not being in map
  encrypt = Encrypt.new(input_message, "12345", Date.today)
  encrypted_message = encrypt.final_encryption
  output_message = File.open(text_out, "w").write(encrypted_message)
end

text_reader
