control 'Tomcat Deps tomcat8' do
  impact 1.0
  title 'national-parks'
  desc 'Checks the dependencies of the np-mongodb running service'
  describe hab_pkg_deps(url: 'http://localhost', name: 'national-parks', group: 'default', pkg_name: 'glibc') do
    its('origin') { should eq 'core' }
    its('version') { should eq  '2.22' }
    its('release') { should be >= 20170513201042 }
  end
end
