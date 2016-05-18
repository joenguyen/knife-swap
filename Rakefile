require 'bundler'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'
require 'yard'

Bundler::GemHelper.install_tasks
RSpec::Core::RakeTask.new(:spec)
Coveralls::RakeTask.new

task :style do
  sh 'rubocop'
end

task :doc do
  sh 'yard'
end

task default: [:style, :spec, :doc, 'coveralls:push']
