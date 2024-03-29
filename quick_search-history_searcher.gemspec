$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "quick_search/history/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "quick_search-history"
  spec.version     = QuickSearch::History::VERSION
  spec.authors     = ["Gregory Wiedeman"]
  spec.email       = ["gregory.wiedeman1@gmail.com"]
  spec.homepage    = "https://archives.albany.edu"
  spec.summary     = "Searcher for UA History app."
  spec.description = "Plugin for NCSU QuickSearch bento-style search results app that searches a blacklight app that discovers events from UAlbany's history."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.2.4"

  spec.add_development_dependency "sqlite3"
end
