#!/usr/bin/env rake
require "bundler/gem_tasks"

desc 'Verify that nothing is broken against the simple solo example'
task :test do
  Dir.chdir('./examples/simple-solo') do
    sh 'ruby -I../../lib -S chef-solo -c solo.rb -j dna.json'
  end
end

task :default => :test
