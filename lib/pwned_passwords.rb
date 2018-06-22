require 'digest'
require 'faraday'

PWNED_PASSWORD_API = 'https://api.pwnedpasswords.com/range/'.freeze

class PwnedPasswords
  def self.check_password(password)
    password_score = 0
    hashed_password = Digest::SHA1.hexdigest password
    hashed_password.upcase!
    # get the first five characters
    hashed_password_prefix = hashed_password[0,5]
    hashed_password_suffix = hashed_password[5..-1]
    query_url = "#{PWNED_PASSWORD_API}#{hashed_password_prefix}"
    api_response = Faraday.get query_url
    if api_response.body.length > 0
      suffixes = api_response.body.split("\r\n")
      suffixes.each do |line|
        suffix,count = line.split(":")
        if suffix == hashed_password_suffix
          password_score = count.to_i
        end
      end
    end
    if password_score > 100
      puts "This password has been detected in too many breaches"
    elsif (password_score > 20 && password_score < 100)
      puts "This password is not great. Consider changing it."
    else
      puts "This password is okay"
    end
  end
end
