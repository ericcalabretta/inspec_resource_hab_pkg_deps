name = attribute('name', default:'sample')
group = attribute('group', default:'default')
url = attribute('url', default:'http://35.161.123.109')

control 'Health Check' do
  impact 1.0
  title 'Health Check OK'
  desc 'Checks the habitat health check'
  describe hab_health_check(url: attribute('url'), name: name, group: attribute('group')) do
    its('health') { should eq 'OK' }
  end
end

control 'Habitat Version' do
    impact 1.0
    title 'Habitat Version 78'
    desc 'Checks the habitat version is the expected version'
    describe hab_sys(url: attribute('url'), name: attribute('name'), group: attribute('group')) do
      its('hab_version') { should eq '0.78.0/20190313123140' }
    end
  end

control 'Habitat Supervisor Configuration' do
    impact 0.7
    title 'Confirm bldr_url, channel, topology, update_strategy, state'
    desc 'Checks the status of the sample service'
    describe hab_service(url: attribute('url'), name: attribute('name'), group: attribute('group')) do
      its('bldr_url') { should eq 'https://bldr.habitat.sh'}
      its('channel') { should eq 'stable'}
      its('topology') { should eq 'standalone'}
      its('update_strategy') { should eq 'at-once'}
      its('desired_state') { should eq 'Up'}
    end
  end
  

control 'Deployed Release' do
    impact 1.0
    title 'Current Release 20190314030908'
    desc 'Confirms the exact expected version of the package is running'
    describe hab_pkg(url: attribute('url'), name: attribute('name'), group: attribute('group')) do
      its('pkg_ident') { should eq 'eric/sample/0.1.0/20190312164739' }
    end
  end