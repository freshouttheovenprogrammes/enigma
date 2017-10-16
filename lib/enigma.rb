require 'pry'
require './lib/key'
require './lib/offset'
require './lib/encrypt'
require './lib/decrypt'

class Enigma
  attr_reader :rotations,
              :offset,
              :key_rotations

  def initialize
    @key_rotations = []
    @offset = []
    @rotations = []
  end

  def encrypt(message, key = 0, date = Date.today)
    encrypted_message = Encrypt.new(message, key, date).final_encryption
  end

  def decrypt(message, key = 0, date = Date.today)
    decrypted_message = Decrypt.new(message, key, date).final_decryption
  end

  def crack(message)
    #first find length of message
    message_array = message.split("")
    #use %4 to find rotations for last 7 characters (..end..)
    message_array.map.with_index do |letter, index|
      index % 4
    end
    #[-7..-1]
  end

  #working with file
  # .zip refactor to combine arrays for CRACK
  #make Encryt and Decrypt classes separate
  #may need to reset instance variables to 0, especially if you encrypt/decrypt multiple times.

end
