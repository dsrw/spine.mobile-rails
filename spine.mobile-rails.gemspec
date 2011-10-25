# -*- encoding: utf-8 -*-
require File.expand_path('../lib/spine/mobile/rails/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "spine.mobile-rails"
  s.version     = Spine::Mobile::Rails::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alex MacCaw", "Scott Wadden"]
  s.email       = ["scott.wadden@gmail.com"]
  s.summary     = "Use Spine Mobile with Rails 3"
  s.description = "This gem provides Spine Mobile for your Rails 3 application."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "spine.mobile-rails"

  s.add_dependency             "rails", ">= 3.1.0"
  s.add_dependency             "spine-rails"
  s.add_development_dependency "bundler"
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").select{|f| f =~ /^bin/}
  s.require_path = 'lib'
end