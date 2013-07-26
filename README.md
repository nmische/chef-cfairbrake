[![Build Status](https://secure.travis-ci.org/nmische/chef-cfairbrake.png)](http://travis-ci.org/nmische/chef-cfairbrake)

Description
===========

Installs ColdFusion client component for Airbrake.io, cfairbrake.cfc.

Recipes
=======
  
  * `cfairbrake` - Installs ColdFusion client component for Airbrake.io, cfairbrake.cfc.


Attributes
=============

  * `node['cfairbrake']['download_url']` - The URL for the ColdFire installation bits. Default is: "https://raw.github.com/nmische/cfairbrake/1.0.2/cfairbrake.cfc"
  * `node['cfairbrake']['install_path'']` - Where to install the component. Default is: "/vagrant/frameworks/cfairbrake"
  * `node['cfairbrake']['owner']` - The owner. Default is `nil` which will result in owner being set to `node['cf10']['installer']['runtimeuser']`
  * `node['cfairbrake']['group']` - The group. Default is "bin"
  