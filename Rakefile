# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
require File.dirname(__FILE__)+"/rake/jeweler_prerelease_tasks"
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "buildr-html5"
  gem.homepage = "http://github.com/devboy/buildr-html5"
  gem.license = "MIT"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "dominic.graefen@gmail.com"
  gem.authors = ["devboy"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new
Jeweler::PrereleaseTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
require 'ci/reporter/rake/rspec'

ENV["CI_REPORTS"] ||= File.expand_path( File.join( File.dirname(__FILE__), "test", "report" ) )
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :spec => "ci:setup:rspec"

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :test => :spec
task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "buildr-html5 #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
