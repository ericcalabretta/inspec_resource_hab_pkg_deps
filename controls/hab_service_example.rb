control 'hab_service' do
    impact 0.7
    title 'np-mongodb'
    desc 'Checks the status of the np-mongodb service'
    describe hab_service(url:"http://localhost", name:"sample", group:"default") do
      its('bldr_url') { should eq 'https://bldr.habitat.sh'}
      its('channel') { should eq 'stable'}
      its('topology') { should eq 'standalone'}
      its('update_strategy') { should eq 'none'}
      its('desired_state') { should eq 'Up'}

    end
  end
  