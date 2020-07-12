
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "forex_rates/version"

Gem::Specification.new do |spec|
  spec.name          = "forex_rates"
  spec.version       = ForexRates::VERSION
  spec.authors       = ["Partho Ghosh"]
  spec.email         = ["partho.ghosh24@gmail.com"]

  spec.summary       = %q{Simple gem to fetch foreign exchange rates with optional in-built caching.}
  spec.description   = %q{Built upon https://exchangeratesapi.io/, this gem allows to fetch current exchange rates and more. It comes with an optional built-in cache support built on top of faraday-http-cache which if activated, can enable caching for the response.}
  spec.homepage      = "https://github.com/parthoghosh24/forex_rates"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/parthoghosh24/forex_rates"
    spec.metadata["changelog_uri"] = "https://github.com/parthoghosh24/forex_rates"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "faraday", "~> 1.0.1"
  spec.add_dependency "faraday-http-cache", "~> 2.2.0"
end
