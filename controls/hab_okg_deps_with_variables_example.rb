url = 'http://localhost'
name = 'np-mongodb'
group = 'default'
pkg_name = 'glibc'
pkg_origin = 'core'
pkg_release = '20170513201042'
pkg_version = '2.22'

control 'Mongo Deps glibc' do
  impact 0.7
  title 'np-mongodb'
  desc 'Checks the dependencies of the np-mongodb running service'
  describe hab_pkg_deps(url: url, name: name, group: group, pkg_name: pkg_name) do
    its('origin') { should eq pkg_origin }
    its('release') { should eq pkg_release }
    its('version') { should eq pkg_version }
  end
end
