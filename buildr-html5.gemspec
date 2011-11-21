# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "buildr-html5"
  s.version = "0.0.1.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1") if s.respond_to? :required_rubygems_version=
  s.authors = ["jankeesvw", "devboy"]
  s.date = "2011-11-21"
  s.description = "Build like you code - now supporting HTML, JS and CSS"
  s.email = "jankees@base42.nl"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "buildr-html5.gemspec",
    "lib/buildr/html5.rb",
    "lib/buildr/html5/compiler.rb",
    "lib/buildr/html5/compiler/closure.rb",
    "rake/jeweler.rb",
    "rake/jeweler_prerelease_tasks.rb",
    "rake/pre_release_gemspec.rb",
    "rake/pre_release_to_git.rb",
    "spec/html5/compiler/closure_spec.rb",
    "spec/sandbox.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/base42/buildr-html5"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Build like you code - now supporting HTML, JS and CSS"
  s.test_files = [
    "spec/html5/compiler/closure_spec.rb",
    "spec/sandbox.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<buildr>, ["~> 1.4.6"])
      s.add_development_dependency(%q<buildr>, ["~> 1.4.6"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<simplecov-rcov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_development_dependency(%q<ci_reporter>, ["~> 1.6.5"])
    else
      s.add_dependency(%q<buildr>, ["~> 1.4.6"])
      s.add_dependency(%q<buildr>, ["~> 1.4.6"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<simplecov-rcov>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.1.0"])
      s.add_dependency(%q<ci_reporter>, ["~> 1.6.5"])
    end
  else
    s.add_dependency(%q<buildr>, ["~> 1.4.6"])
    s.add_dependency(%q<buildr>, ["~> 1.4.6"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<simplecov-rcov>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.1.0"])
    s.add_dependency(%q<ci_reporter>, ["~> 1.6.5"])
  end
end

