control 'dependency_acl' do
  impact 1.0
  title 'acl'
  desc 'Checks the dependencies of the national-park running service'
  describe hab_pkg_deps(url: 'http://localhost', name: 'national-parks', group: 'dev', pkg_name: 'acl') do
    its('origin') { should eq 'core' }
    its('version') { should eq  '2.2.52' }
    its('release') { should be >= 20170513213108 }
  end
end

# control 'dependency_attr' do
#   impact 1.0
#   title 'attr'
#   desc 'Checks the dependencies of the national-park running service'
#   describe hab_pkg_deps(url: 'http://54.200.140.118', name: 'national-parks', group: 'dev', pkg_name: 'acl') do
#     its('origin') { should eq 'core' }
#     its('version') { should eq  '2.2.52' }
#     its('release') { should be >= 20170513213108 }
#   end
# end