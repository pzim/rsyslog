require 'spec_helper'

describe 'rsyslog' do
  it "should contain package rsyslog" do
    should contain_package('rsyslog').with(
      'ensure' => 'installed',
    )
  end

  it "should define rsyslog service" do
    should contain_service('rsyslog').with(
      'ensure'  => 'running',
      'enable'  => 'true',
    )
  end

  context 'with enable => false, start => false' do
    let(:params) {
      {:enable => 'false', :start => 'false'}
    }
    it do
    should contain_service('rsyslog').with(
      'ensure'  => 'stopped',
      'enable'  => 'false',
    )
    end
  end

  it "should contain /etc/rsyslog.conf" do
    should contain_file('/etc/rsyslog.conf').with(
      'ensure' => 'present',
      'mode'   => '0644',
      'group'  => 'root',
      'owner'  => 'root',
    )
  end

  it "should contain /etc/rsyslog.d/remoteConfig.conf" do
    should contain_file('/etc/rsyslog.d/remoteConfig.conf').with(
      'ensure' => 'present',
      'mode'   => '0644',
      'group'  => 'root',
      'owner'  => 'root',
    ) 
  end
 
  context 'with server => my_server.com' do
    let(:params) { {:server => 'my_server.com'} }
    it do
      should contain_file('/etc/rsyslog.d/remoteConfig.conf').with_content(/$*\*\.\* @@my_server.com:514/)
    end
  end

  context 'with server => my_server-02.com, server_port => 6789' do
    let(:params) {
      {:server => 'my_server-02.com', :server_port => '6789'}
    }
    it do
      should contain_file('/etc/rsyslog.d/remoteConfig.conf').with_content(/$*\*\.\* @@my_server-02.com:6789/)
    end
  end
end 
