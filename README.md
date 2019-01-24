# Custom InSpec resource to validate running .hart dependencies

This custom resource uses the Habitat Supervisor API to test package dependencies. It Ruby's HTTPClient so you don't need to use InSpec Target mode for remote systems. You specify the remote target in the URL of the profil, or if you're running against the local machine the URL should be localhost. 

## Check package: 
-origin  
-version  
-release  

## Usage

1. update the URL, Name, Group, and pkg_name in the control for supervisor you want to test

2. update the control(s) for the origin/version/release you wish to test

3. Run the control against the target node. You can use InSpec exec, habitat managed inspec, etc to actually run the test. 

```
inspec exec inspec_resource_hab_pkg_deps

Profile: Dependencies-with-CVEs (Dependencies-with-CVEs)
Version: 0.2.1
Target:  local://

  ✔  CVE-2017-16997: glibc
     ✔  hab_pkg_deps origin should eq "core"
     ✔  hab_pkg_deps version should eq "2.27"
     ✔  hab_pkg_deps release should be >= 20180608041157


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 3 successful, 0 failures, 0 skipped
```

To do:  
-input deps as variables rather than individually list them   
-change version to something easier to compare, aka not a string   
-add error handling   
