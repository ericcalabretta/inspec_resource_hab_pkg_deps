control 'hab system information' do
    impact 1.0
    title 'hab sys'
    desc 'Checks the habitat version is the expected version'
    describe hab_sys(url: attribute('url'), name: attribute('name'), group: attribute('group')) do
      its('hab_version') { should eq '0.74.0/20190204225911' }
    end
  end