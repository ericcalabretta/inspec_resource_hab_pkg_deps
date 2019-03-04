
control 'Health Check' do
    impact 1.0
    title 'Health Check'
    desc 'Checks the habitat health check'
    describe hab_health_check(url: attribute('url'), name: attribute('name'), group: attribute('group')) do
      its('health') { should eq 'OK' }
    end
  end