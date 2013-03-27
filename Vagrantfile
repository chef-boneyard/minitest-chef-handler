require "berkshelf/vagrant"

unless ARGV[0] == "destroy"
  # use current files, not the released gem from rubygems
  result = `rake build`
  raise "BUILD FAILED: #{result}" unless $?.success?
  package = result[%r{pkg/.*}].sub(/\.$/,"")
end

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.provision :shell, :inline => "gem install /vagrant/#{package} --no-rdoc --no-ri"
  config.vm.provision :chef_solo do |chef|
    #chef.log_level = :debug
    #chef.json = {"minitest" => {"verbose" => true}}
    chef.run_list = [
      "recipe[spec_examples]",
      "minitest-handler",
    ]
  end
end
