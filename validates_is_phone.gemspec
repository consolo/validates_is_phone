Gem::Specification.new do |s|
  s.name = 'validates_is_phone'
  s.version = '1.0.0'
  s.author = 'Andrew Coleman'
  s.email = 'developers@consoloservices.com'
  s.summary = 'Validates Is Phone'
  s.description = 'Adds active record validation for US phone numbers'
  s.homepage = 'https://redmine.consoloservices.com'
  s.require_path = '.'
  s.files = [ 'validates_is_phone.rb' ]
  s.add_dependency 'activerecord'
end
