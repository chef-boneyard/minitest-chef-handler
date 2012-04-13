require 'minitest-chef-handler'

path = './{test/test_*,spec/*_spec}.rb'

report_handlers << MiniTest::Chef::Handler.new(:path => path)
cookbook_path File.expand_path('cookbooks', File.dirname(__FILE__))
