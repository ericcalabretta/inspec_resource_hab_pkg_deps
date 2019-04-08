control 'Deployment mismatch' do
    impact 1.0
    title 'confirm deployment 20190303202613'
    desc 'Confirms the exact expected version of the package is running'
    describe hab_pkg(url: attribute('url'), name: attribute('name'), group: attribute('group')) do
      its('pkg_ident') { should eq 'eric/sample/0.1.0/20190303202613' }
      its('pkg_svc_user') { should eq 'hab' }
      its('pkg_svc_group') { should eq 'hab' }
    end
  end