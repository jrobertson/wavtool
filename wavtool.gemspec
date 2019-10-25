Gem::Specification.new do |s|
  s.name = 'wavtool'
  s.version = '0.1.0'
  s.summary = 'wavtool'
  s.authors = ['James Robertson']
  s.files = Dir['lib/wavtool.rb']
  s.add_runtime_dependency('c32', '~> 0.2', '>=0.2.0')
  s.add_runtime_dependency('wavefile', '~> 1.1', '>=1.1.0')
  s.signing_key = '../privatekeys/wavtool.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/wavtool'
end
