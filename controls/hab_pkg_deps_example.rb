control 'Mongo Deps' do
  impact 0.7
  title 'np-mongodb'
  desc 'Checks the dependencies of the np-mongodb running service'
  describe hab_pkg_deps(url: 'http://localhost', name: 'np-mongodb', group: 'default', pkg_name: 'glibc') do
    its('origin') { should eq 'core' }
    its('release') { should eq '20170513201042' }
    its('version') { should eq '2.22' }
  end
end

control 'Tomcat Deps' do
  impact 0.7
  title 'national-parks'
  desc 'Checks the dependencies of the np-mongodb running service'
  describe hab_pkg_deps(url: 'http://localhost', name: 'national-parks', group: 'default', pkg_name: 'tomcat8') do
    its('origin') { should eq 'core' }
    its('release') { should eq '20170514144202' }
    its('version') { should eq '8.5.9' }
  end
end


describe hab_pkg_deps(url: 'http://localhost', name: 'national-parks', group: 'default', pkg_name: 'fake-pkg-name') do
  its('origin') { should eq 'core' }
  its('release') { should eq '20170514144202' }
  its('version') { should eq '8.5.9' }
end
