require 'spec_helper'

describe 'cassandra' do
  context 'supported operating systems' do
    ['RedHat'].each do |osfamily|
      ['RedHat', 'CentOS', 'Amazon', 'Fedora'].each do |operatingsystem|
        let(:facts) {{
          :osfamily        => osfamily,
          :operatingsystem => operatingsystem,
          :processorcount => 1,
          :ipaddress => '1.2.3.4'
        }}

        # default_broker_configuration_file  = '/etc/mosquitto/conf.d/mosquitto.conf'

        context "with explicit data (no Hiera)" do

          describe "cassandra with default settings on #{osfamily}" do
            let(:params) {{ :seeds => ['1.2.3.4'], :broadcast_address => '4.3.2.1' }}
            # We must mock $::operatingsystem because otherwise this test will
            # fail when you run the tests on e.g. Mac OS X.
            it { should compile.with_all_deps }

            it { should contain_class('cassandra::params') }
            it { should contain_class('cassandra') }
            it { should contain_class('cassandra::users').that_comes_before('cassandra::install') }
            it { should contain_class('cassandra::install').that_comes_before('cassandra::config') }
            it { should contain_class('cassandra::config') }
            it { should contain_class('cassandra::service').that_subscribes_to('cassandra::config') }

            # it { should contain_package('cassandra').with_ensure('present') }

            it { should contain_group('cassandra').with({
              'ensure'     => 'present',
              'gid'        => 53064,
            })}

            it { should contain_user('cassandra').with({
              'ensure'     => 'present',
              'home'       => '/home/cassandra',
              'shell'      => '/bin/bash',
              'uid'        => 53064,
              'comment'    => 'Cassandra system account',
              'gid'        => 'cassandra',
              'managehome' => true
            })}

            #it { should contain_file('/opt/mosquitto/logs').with({
            #  'ensure' => 'directory',
            #  'owner'  => 'mosquitto',
            #  'group'  => 'mosquitto',
            #  'mode'   => '0755',
            #})}

#            it { should contain_file('/var/log/mosquitto').with({
#              'ensure' => 'directory',
#              'owner'  => 'mosquitto',
#              'group'  => 'mosquitto',
#              'mode'   => '0755',
#            })}

            # it { should contain_file(default_broker_configuration_file).with({
            #     'ensure' => 'file',
            #     'owner'  => 'root',
            #     'group'  => 'root',
            #     'mode'   => '0644',
            #   }).
            #   with_content(/\sport\s1883\s/)
            # }


            it { should contain_supervisor__service('cassandra').with({
              'ensure'      => 'present',
              'enable'      => true,
              'command'     => 'service cassandra start',
              'user'        => 'cassandra',
              'group'       => 'cassandra',
              'autorestart' => true,
              'startsecs'   => 10,
              'retries'     => 999,
              'stopsignal'  => 'TERM',
              'stopasgroup' => false,
              'stopwait'    => 10,
              'stdout_logfile_maxsize' => '20MB',
              'stdout_logfile_keep'    => 5,
              'stderr_logfile_maxsize' => '20MB',
              'stderr_logfile_keep'    => 10,
            })}
          end


          describe "cassandra with disabled user management on #{osfamily}" do
            let(:params) {{
              :user_manage  => false,
            }}
            it { should_not contain_group('cassandra') }
            it { should_not contain_user('cassandra') }
          end

          describe "cassandra with custom user and group on #{osfamily}" do
            let(:params) {{
              :user_manage      => true,
              :gid              => 456,
              :group            => 'cassandragroup',
              :uid              => 123,
              :user             => 'cassandrauser',
              :user_description => 'Cassandra user',
              :user_home        => '/home/cassandrauser',
            }}

            it { should_not contain_group('cassandra') }
            it { should_not contain_user('cassandra') }

            it { should contain_user('cassandrauser').with({
              'ensure'     => 'present',
              'home'       => '/home/cassandrauser',
              'shell'      => '/bin/bash',
              'uid'        => 123,
              'comment'    => 'Cassandra user',
              'gid'        => 'cassandragroup',
              'managehome' => true,
            })}

            it { should contain_group('cassandragroup').with({
              'ensure'     => 'present',
              'gid'        => 456,
            })}
          end

          # describe "cassandra with a custom port on #{osfamily}" do
          #   let(:params) {{
          #     :port => 9093,
          #   }}
          #   it { should contain_file(default_broker_configuration_file).with_content(/\sport\s9093\s/) }
          # end
        end

      end
    end
  end

  context 'unsupported operating system' do
    describe 'cassandrag without any parameters on Debian' do
      let(:facts) {{
        :osfamily => 'Debian',
      }}

      it { expect { should contain_class('cassandrag') }.to raise_error(Puppet::Error,
        /The cassandrag module is not supported on a Debian based system./) }
    end
  end
end
