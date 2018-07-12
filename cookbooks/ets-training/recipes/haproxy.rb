#
# Cookbook:: ets-training
# Recipe:: haproxy
# User:: cs060616
# Email:: chris.schaaf@cerner.com
# Copyright:: 2018, The Authors, All Rights Reserved.

# Get HAProxy
yum_package 'haproxy' do
  action :install
end

# Create config from template
template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  variables(backend_nodes: search(:node, 'role:web').sort_by(&:name))
  notifies :reload, 'service[haproxy]' # Reload service on config change
end

service 'haproxy' do
  supports status: true, restart: true, reload: true
  action %i[enable start]
end
