
include_recipe 'ganglia'

package "gmetad" do
  action :install
end

directory "/var/lib/ganglia/rrds" do
  owner "ganglia"
end

service "gmetad" do
  action [:enable,:start]
end

template "/etc/ganglia/gmetad.conf" do
  source "gmetad.conf.erb"
  owner "ganglia"
  mode 0644
  notifies :restart, resources(:service => "gmetad")
end
