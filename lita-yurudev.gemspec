Gem::Specification.new do |spec|
  spec.name          = "lita-yurudev"
  spec.version       = "0.0.1"
  spec.authors       = ["fukayatsu"]
  spec.email         = ["fukayatsu@gmail.com"]
  spec.description   = %q{Yurufuwa Devroom Toolkit}
  spec.summary       = %q{Yurufuwa Devroom Toolkits}
  spec.homepage      = "https://github.com/fukayatsu/lita-yurudev"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.0"
  spec.add_runtime_dependency "faraday", "~> 0.9.0"


  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
