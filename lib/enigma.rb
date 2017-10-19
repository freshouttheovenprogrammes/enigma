require 'pry'
require './lib/key'
require './lib/offset'
require './lib/encrypt'
require './lib/decrypt'
require './lib/crack'

class Enigma

  def encrypt(message, key = 0, date = Date.today)
    encrypted_message = Encrypt.new(message, key, date).final_encryption
  end

  def decrypt(message, key = 0, date = Date.today)
    decrypted_message = Decrypt.new(message, key, date).final_decryption
  end

  def crack(message, date = Date.today)
    cracked_message = Crack.new(message, date).output
  end

end

#fix issue with date data type in decrypt runner
#find key for crack (iterate 00000-99999)?
#make more tests!!!
