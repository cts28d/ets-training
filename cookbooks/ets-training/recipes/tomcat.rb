#
# Cookbook:: ets-training
# Recipe:: tomcat
# User:: cs060616
# Email:: chris.schaaf@cerner.com
# Copyright:: 2018, The Authors, All Rights Reserved.

# Get tomcat
yum_package 'tomcat' do
  action :install
end

# Get sample app
remote_file '/usr/share/tomcat/webapps/sample.war' do
  source 'http://tomcat.apache.org/tomcat-6.0-doc/appdev/sample/sample.war'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

# start it up
service 'tomcat' do
  action :start
end
