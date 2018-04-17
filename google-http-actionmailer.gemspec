
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google_http_actionmailer/version"

Gem::Specification.new do |spec|
  spec.name          = "google-http-actionmailer"
  spec.version       = GoogleHttpActionmailer::VERSION
  spec.authors       = ["Kartik Luke Singh"]
  spec.email         = ["kartikluke@gmail.com"]

  spec.summary       = %q{Google HTTP API support for Actionmailer}
  spec.description   = %q{Use Actionmailer with Google's HTTP API}
  spec.homepage      = "https://github.com/kartikluke/google-http-actionmailer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'mail', '~> 2.5'
  spec.add_dependency 'google-api-client', '~> 0.19'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
