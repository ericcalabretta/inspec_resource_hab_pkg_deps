control 'CVE-2017-16997' do
  impact 1.0
  title 'glibc'
  desc 'Checks the dependencies of the national-park running service'
  describe hab_pkg_deps(url: 'http://localhost', name: 'national-parks', group: 'default', pkg_name: 'glibc') do
    its('origin') { should eq 'core' }
    its('version') { should eq  '2.27' }
    its('release') { should be >= 20180608041157 }
  end
end