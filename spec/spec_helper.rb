require 'puppetlabs_spec_helper/module_spec_helper'

fixture_path = File.expand_path(File.join(__FILE__, '..', 'fixtures'))
module_path = File.expand_path(File.join(fixture_path, 'modules'))

RSpec.configure do |c|
  c.default_facts = {
    :kernel => 'Linux',
    :operatingsystem => 'CentOS',
    :operatingsystemrelease => '6.4',
    :lsbmajdistrelease => '6',
    :osfamily => 'RedHat',
    :architecture => 'x86_64',
  }
end
