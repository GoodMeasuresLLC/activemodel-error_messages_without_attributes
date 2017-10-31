# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activemodel/error_messages_without_attributes/version"

Gem::Specification.new do |spec|
  spec.name          = "activemodel-error_messages_without_attributes"
  spec.version       = ActiveModel::ErrorMessagesWithoutAttributes::VERSION
  spec.authors       = ["John Naegle", "Rob Mathews"]
  spec.email         = ["john.naegle@goodmeasures.com", "rob.mathews@goodmeasures.com"]

  spec.summary       = %q{Extends ActiveModel::Errors to allow messages to be generated that do not use the attribute name.}
  spec.description   = %q{Extends ActiveModel::Errors to allow messages to be generated that do not use the attribute name}
  spec.homepage      = "https://github.com/GoodMeasuresLLC/activemodel-error_messages_without_attributes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"

end
