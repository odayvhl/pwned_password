Gem::Specification.new do |s|
  s.name = 'pwned_passwords'
  s.version = '0.0.5'
  s.date = '2019-08-27'
  s.summary = 'Checks Pwned Passwords API for passwords disclosed in previous breaches.'
  s.description = 'Checks against the Pwned Passwords API using the first five characters of the SHA1 hash of a password to determine if it exists in previously disclosed breaches.'
  s.authors = ["Oliver Day"]
  s.email = 'oday@vistahigherlearning.com'
  s.files = ["lib/pwned_passwords.rb"]
  s.homepage = 'https://rubygems.org/gems/pwned_passwords'
  s.license = 'MIT'
  s.add_development_dependency 'faraday', '~> 0.15'
end
