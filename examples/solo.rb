require 'minitest-chef-handler'

report_handlers << MiniTest::Chef::Handler.new
cookbook_path File.expand_path('cookbooks', File.dirname(__FILE__))
