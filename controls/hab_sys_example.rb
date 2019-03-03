control 'sys' do
    impact 1.0
    title 'sys'
    desc 'Checks the dependencies of the national-park running service'
    describe hab_sys(url: 'http://localhost', name: 'sample', group: 'default') do
      its('hab_version') { should eq '0.74.0/20190204225911' }
    end
  end