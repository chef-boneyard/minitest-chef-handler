# Minitest Chef Handler

Run minitest suites after your Chef recipes to check the status of your system.

## Motivation

Working at Engine Yard I have to maintain a quite complicated set of Chef recipes that we use to set up our customers' instances. I need to be sure that everytime someone modify those recipes, mostly myself, the provisioned services continue working as expected.

There are other solutions that evaluate the configured node after the recipes
are loaded without arriving to the converge phase, like [ChefSpec](https://github.com/acrmp/chefspec) or [rspec-chef](https://github.com/calavera/rspec-chef), but I needed something to write integration tests easily. I checked [chef-minitest](https://github.com/fujin/chef-minitest) but I'm still amazed by the ugly code that I have to write into the recipes to make it work.

## Installation

```
$ gem install minitest-chef-handler
```

## Usage

1. Add the report handler to your client.rb or solo.rb file:

```ruby
require 'minitest-chef-handler'

report_handlers << MiniTest::Chef::Handler.new
```

2. Write your tests as normal MiniTest cases extending from MiniTest::Chef::TestCase:

```ruby
class TestNginx < MiniTest::Chef::TestUnit
  def test_config_file_exist
    assert File.exist?('/etc/nginx.conf')
  end
end
```

You still have access to Chef's `run_status`, `node` and `run_context` from your tests:

```ruby
class TestNginx < MiniTest::Chef::TestUnit
  def test_config_file_exist
    assert run_status.success?
  end
end
```

## Further configuration

These are the options the handler accepts:

* :path => where your test files are, './test/test_*.rb' by default
* :filter => filter test names on pattern
* :seed => set random seed
* :verbose => show progress processing files.

Example:

```ruby
handler = MiniTest::Chef::Handler.new({
  :path    => './cookbooks/test/*_test.rb',
  :filter  => 'foo',
  :seed    => srand,
  :verbose => true})

report_handlers << handler
```

## Copyright

Copyright (c) 2012 David Calavera. See LICENSE for details.
