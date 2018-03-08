# encoding: utf-8
# copyright: 2018, The Authors

title 'sample section'

control 'production' do
  impact 0.7
  title 'national parks'
  describe hab_ring(url:"http://localhost") do
    its('census_groups') { should include 'haproxy.production'}
    its('census_groups') { should include 'national-parks.production'}
    its('census_groups') { should include 'np-mongodb.production'}
  end
end

control 'development' do
  impact 0.7
  title 'national parks'
  describe hab_ring(url:"http://localhost") do
    its('census_groups') { should include 'haproxy.development'}
    its('census_groups') { should include 'national-parks.development'}
    its('census_groups') { should include 'np-mongodb.development'}
  end
end


# describe hab_ring(url:"http://34.244.174.195") do
#   its('census_groups') { should include 'haproxy.production'}
# end
