# frozen_string_literal: true

require_relative "lib/tfhelps/version"

Gem::Specification.new do |spec|
  spec.name = "tfhelps"
  spec.version = Tfhelps::VERSION
  spec.authors = ["Wuletaw Wonte"]
  spec.email = ["wuletawwonte@gmail.com"]

  spec.summary = "Helps Text Formatter: AI-powered text formatting for Helps Ministries."
  spec.description = <<~DESC
    The Helps Text Formatter gem is a command-line tool designed for Helps Ministries to clean up and format text files using the power of Google's Gemini API.
    It takes a .txt file as input, sends the content to the Gemini API for intelligent formatting, and saves the professionally formatted text to a new file.
  DESC

  spec.homepage = "https://github.com/wuletawwonte/tfhelps.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/wuletawwonte/tfhelps.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ appveyor Gemfile])
    end
  end
  spec.bindir = "bin"
  spec.executables = ["tfhelps"]
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
