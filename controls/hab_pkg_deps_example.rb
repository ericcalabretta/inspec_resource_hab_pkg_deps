
control 'Tomcat Deps tomcat8' do
  impact 0.7
  title 'national-parks'
  desc 'Checks the dependencies of the np-mongodb running service'
  describe hab_pkg_deps(url: 'http://localhost', name: 'national-parks', group: 'default', pkg_name: 'tomcat8') do
    its('origin') { should eq 'core' }
    its('release') { should eq  '20170514144202-wrong' }
    its('version') { should eq '8.5.9' }
  end
end
