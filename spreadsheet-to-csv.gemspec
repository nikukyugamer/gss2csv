# frozen_string_literal: true

require_relative 'lib/spreadsheet/to/csv/version'

Gem::Specification.new do |spec|
  spec.name = 'spreadsheet-to-csv'
  spec.version = Spreadsheet::To::Csv::VERSION
  spec.authors = ['Osamu Takiya']
  spec.email = ['takiya@toran.sakura.ne.jp']

  spec.summary = 'TOODOO: Write a short summary, because RubyGems requires one.'
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.description = 'TOODOO: Write a longer description or delete this line.'
  # spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.homepage = 'https://github.com/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['allowed_push_host'] = "TOODOO: Set to your gem server 'https://example.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata['source_code_uri'] = 'https://github.com/'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  spec.metadata['changelog_uri'] = 'https://github.com/'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
