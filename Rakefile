require "rubygems"
require "bundler"
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require "rake"

require "jeweler"
Jeweler::Tasks.new do |gem|
  gem.name = "minjector"
  gem.homepage = "http://github.com/steveh/minjector"
  gem.license = "MIT"
  gem.summary = %Q{minjector submits a directory tree to a central server for parsing}
  gem.description = %Q{minjector submits a directory tree to a central server for parsing}
  gem.email = "steve@seven.net.nz"
  gem.authors = ["Steve Hoeksema"]
end
Jeweler::RubygemsDotOrgTasks.new

require "rspec/core"
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList["spec/**/*_spec.rb"]
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = "spec/**/*_spec.rb"
  spec.rcov = true
end

task :default => :spec

require "yard"
YARD::Rake::YardocTask.new