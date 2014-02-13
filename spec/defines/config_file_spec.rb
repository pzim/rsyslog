require 'spec_helper'

describe 'rsyslog::config_file' do

    let(:title) { '/etc/rsyslog.d/logForward.conf' }
    let(:params) { 
      {:config_hash => {'audit' => 
        {'InputFileName'      => '/data/logs/someapp/audit.log',
         'InputFileTag'       => 'someapp-audit',
         'InputFileStateFile' => 'someapp-audit-state',
         'InputFileSeverity'  => 'info',
         'InputFileFacility'  => 'local6'
        } }

      }
    }

    it "should contain /etc/rsyslog.d/logForward.conf" do
      should contain_file('/etc/rsyslog.d/logForward.conf').with_content(/$*InputFileName \/data\/logs\/someapp\/audit.log/)
      should contain_file('/etc/rsyslog.d/logForward.conf').with_content(/$*InputFileTag someapp-audit/)
      should contain_file('/etc/rsyslog.d/logForward.conf').with_content(/$*InputFileStateFile someapp-audit-state/)
      should contain_file('/etc/rsyslog.d/logForward.conf').with_content(/$*InputFileSeverity info/)
      should contain_file('/etc/rsyslog.d/logForward.conf').with_content(/$*InputFileFacility local6/)
    end
end

