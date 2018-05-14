control 'Dev Mongo Service' do
  impact 0.7
  title 'np-mongodb'
  desc 'Checks the status of the np-mongodb service'
  describe hab_service(url:"http://localhost", name:"np-mongodb", group:"default") do
    its('bldr_url') { should eq 'https://bldr.habitat.sh'}
    its('channel') { should eq 'unstable'}
    its('service_group') { should eq 'np-mongodb.development'}
    its('topology') { should eq 'standalone'}
    its('pkg') { should eq 'standalone'}
  end
end
#
# control 'Dev Mongo deps' do
#   impact 0.7
#   title 'np-mongodb'
#   desc 'Checks the status of the np-mongodb pkg_deps'
#   describe hab_deps(url:"http://localhost", name:"np-mongodb", group:"default") do
#     its('deps') { should eq 'standalone'}
#   end
# end
#
#
# control 'Dev Mongo deps' do
#   impact 0.7
#   title 'np-mongodb'
#   desc 'Checks the status of the np-mongodb service'
#   describe hab_service(url:"http://localhost", name:"np-mongodb", group:"default") do
#     its('deps') { should eq 'standalone'}
#   end
# end
#
# # describe hab_ring(url:"http://34.244.174.195") do
# #   its('census_groups') { should include 'haproxy.production'}
# # end
#
#
# # describe hab_deps(url:"http://localhost", name:"np-mongodb", group:"development") do
# #   its('origin') { should eq 'core'}
# #   its('name') { should eq 'unstable'}
# #   its('service_group') { should eq 'np-mongodb.development'}
# #   its('topology') { should eq 'standalone'}
# # end
#
#
# # {"origin":"core","name":"glibc","version":"2.22","release":"20170513201042"}
