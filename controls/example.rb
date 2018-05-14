# control 'Dev Mongo Service' do
#   impact 0.7
#   title 'np-mongodb'
#   desc 'Checks the status of the np-mongodb service'
#   describe hab_service(url:"http://localhost", name:"np-mongodb", group:"default") do
#     its('pkg_deps') { should eq 'standalone'}
#   end
# end

control 'Dev Mongo Service' do
  impact 0.7
  title 'np-mongodb'
  desc 'Checks the status of the np-mongodb service'
  describe hab_pkg_deps(url:"http://localhost", name:"np-mongodb", group:"default", pkg_name:"glibc") do
    its('pkg_deps_deps') { should eq 'standalone'}
    # its('origin') { should cmp 'core'}
    # its('origin') { should eq 'core'}
    # its('release') { should be '20170513215104'}
    # its('version') { should be 'version'}
  end
end



#
# -"standalone"
#  +"name" => "cacerts",
#  +"origin" => "core",
#  +"release" => "20170513215104",
#  +"version" => "version",
