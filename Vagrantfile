require "berkshelf/vagrant"

unless ARGV[0] == "destroy"
  # use current files, not the released gem from rubygems
  result = `rake build`
  raise "BUILD FAILED: #{result}" unless $?.success?
  package = result[%r{pkg/.*}].sub(/\.$/,"")
end

Vagrant.configure("2") do |config|
  config.vm.box      = "opscode-precise64"
  config.vm.box_url  = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"

  # Install required dependencies on the empty VM:
  #  - rubygems from apt repostitory 
  #  - Chef 11 with Omnibus installer
  #  - freshly built minitest-chef-handler gem
  config.vm.provision :shell, :inline => <<EOS
set -e
if ! command -V chef-solo >/dev/null 2>/dev/null; then
  sudo apt-get update -qq
  sudo apt-get install -qq curl rubygems
  curl -L https://www.opscode.com/chef/install.sh | bash -s -- -v 11.6.0
fi
gem install /vagrant/#{package} --no-rdoc --no-ri
EOS

 config.vm.provision :chef_solo do |chef|
    #chef.log_level = :debug
    chef.json = {"minitest" => {"verbose" => false}}
    chef.run_list = [
      "recipe[spec_examples]",
      "minitest-handler",
    ]
  end

end
