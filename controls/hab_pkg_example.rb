control 'CVE-2017-16997' do
    impact 1.0
    title 'glibc'
    desc 'Checks the dependencies of the national-park running service'
    describe hab_pkg(url: attribute('url'), name: attribute('name'), group: attribute('group')) do
      its('pkg_ident') { should eq 'eric/sample/0.1.0/20190303202613' }
      its('pkg_svc_user') { should eq 'root' }
      its('pkg_svc_group') { should eq 'hab' }
    end
  end