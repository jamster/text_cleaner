# -*- encoding: utf-8 -*-
require File.expand_path('../lib/text_cleaner/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jason Amster"]
  gem.email         = ["jayamster@gmail.com"]
  gem.description   = %q{Simple gem does one thing, and one thing only... Turns funky chars such as [FILL IN HERE] to the proper HTML Encodings such as [FILL IN HERE].}
  gem.summary       = %q{Simple gem does one thing, and one thing only... Turns funky chars such as [FILL IN HERE] to the proper HTML Encodings such as [FILL IN HERE].}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "text_cleaner"
  gem.require_paths = ["lib"]
  gem.version       = TextCleaner::VERSION
end
