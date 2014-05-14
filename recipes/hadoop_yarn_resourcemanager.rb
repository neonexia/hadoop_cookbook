#
# Cookbook Name:: hadoop
# Recipe:: hadoop_yarn_resourcemanager
#
# Copyright (C) 2013-2014 Continuuity, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'hadoop::default'

package 'hadoop-yarn-resourcemanager' do
  action :install
end

# YARN needs a /tmp in HDFS
dfs = node['hadoop']['core_site']['fs.defaultFS']
execute 'yarn-hdfs-tmpdir' do
  command "hdfs dfs -mkdir -p #{dfs}/tmp && hdfs dfs -chmod 1777 #{dfs}/tmp"
  timeout 300
  user 'hdfs'
  group 'hdfs'
  not_if "hdfs dfs -test -d #{dfs}/tmp", :user => 'hdfs'
  action :nothing
end

service 'hadoop-yarn-resourcemanager' do
  supports [:restart => true, :reload => false, :status => true]
  action :nothing
end
