require 'spec_helper'

describe 'druid::overlord' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "druid::overlord class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
          :lsbdistid => 'Ubuntu',
          :lsbdistcodename => 'trusty',
          :lsbdistrelease => '14.04',
          :puppetversion   => Puppet.version,
        }}

        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_class('druid') }
        it { is_expected.to contain_class('druid::overlord') }
        it { is_expected.to contain_druid__node('overlord') }
      end
    end
  end

end
