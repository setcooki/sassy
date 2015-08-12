# -*- encoding: utf-8 -*-
require './lib/sassy'

Gem::Specification.new do |gem|
  # Project Information
  gem.name = "jacket"
  gem.version = Sassy::VERSION
  gem.date = Sassy::DATE
  gem.required_rubygems_version = Gem::Requirement.new(">= 1.2")

  # Author Information
  gem.authors = ["setcooki"]
  gem.email = ["set@cooki.me"]

  # Project Description
  gem.description = "foundation extension for sassy"
  gem.summary = "foundation extension for sassy"

  # Gem Files
  gem.files = ["readme.md"]
  gem.files += Dir.glob("lib/**/*.*")
  gem.files += Dir.glob("stylesheets/**/*.*")

  # Dependencies
  gem.add_dependency 'sass',    '~> 3.4.0'
  gem.add_dependency 'compass', "~> 1.0.3"
end