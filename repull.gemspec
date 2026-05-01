# -*- encoding: utf-8 -*-
# frozen_string_literal: true

$:.push File.expand_path('../lib', __FILE__)
require 'repull/version'

Gem::Specification.new do |s|
  s.name        = 'repull'
  s.version     = Repull::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ivan Nikolov']
  s.email       = ['hello@repull.dev']
  s.homepage    = 'https://github.com/ivannikolovbg/repull-ruby'
  s.summary     = 'Ruby SDK for Repull'
  s.description = 'Ruby SDK for the Repull API — the unified API for vacation-rental tech. Connect to 50+ PMS platforms and OTA channels (Airbnb, Booking.com, VRBO, Plumguide) through one REST API. Generated from OpenAPI.'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.7'
  s.metadata = {
    'homepage_uri'      => 'https://github.com/ivannikolovbg/repull-ruby',
    'source_code_uri'   => 'https://github.com/ivannikolovbg/repull-ruby',
    'bug_tracker_uri'   => 'https://github.com/ivannikolovbg/repull-ruby/issues',
    'documentation_uri' => 'https://repull.dev/docs'
  }

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files = Dir[
    'lib/**/*.rb',
    'openapi/**/*',
    'examples/**/*',
    'scripts/**/*',
    'README.md',
    'LICENSE',
    'repull.gemspec',
    'Gemfile',
    'Rakefile'
  ]
  s.test_files    = Dir['spec/**/*']
  s.executables   = []
  s.require_paths = ['lib']
end
