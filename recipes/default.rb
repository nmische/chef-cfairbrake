#
# Cookbook Name:: cfairbrake
# Recipe:: default
#
# Copyright 2013, NATHAN MISCHE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


node.set['cfairbrake']['owner'] = "nobody" if node['cfairbrake']['owner'] == nil

# Create the target install directory if it doesn't exist

directory "#{node['cfairbrake']['install_path']}" do
  owner node['cfairbrake']['owner']
  group node['cfairbrake']['group']
  mode 00755
  recursive true
  action :create
  not_if { File.directory?("#{node['cfairbrake']['install_path']}") }
end

# Download client component

remote_file "#{node['cfairbrake']['install_path']}/cfairbrake.cfc" do
  owner node['cfairbrake']['owner']
  group node['cfairbrake']['group']
  mode 00755
  source node['cfairbrake']['download_url']
end

# Set up ColdFusion mapping

execute "start_cf_for_cfairbrake_default_cf_config" do
  command "/bin/true"
  notifies :start, "service[coldfusion]", :immediately
end

coldfusion10_config "extensions" do
  action :set
  property "mapping"
  args ({ "mapName" => "/cfairbrake",
          "mapPath" => "#{node['cfairbrake']['install_path']}"})
end





