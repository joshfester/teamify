require_relative "lib/teamify/version"

Gem::Specification.new do |spec|
  spec.name        = "teamify"
  spec.version     = Teamify::VERSION
  spec.authors     = ["Josh Fester"]
  spec.email       = ["joshfester@gmail.com"]
  spec.homepage    = "https://github.com/joshfester/teamify"
  spec.summary     = "A minimal Rails engine that provides user teams functionality"
  spec.description = "A minimal Rails engine that provides user teams functionality"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/joshfester/teamify"
  spec.metadata["changelog_uri"] = "https://github.com/joshfester/teamify/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.2"
end
