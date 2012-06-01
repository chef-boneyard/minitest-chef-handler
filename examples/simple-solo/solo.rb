require 'minitest-chef-handler'

path = File.expand_path('{test/test_*,spec/*_spec}.rb', File.dirname(__FILE__))

report_handlers << MiniTest::Chef::Handler.new(:path => path)
cookbook_path File.expand_path('cookbooks', File.dirname(__FILE__))
