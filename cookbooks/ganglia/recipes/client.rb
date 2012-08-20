
include_recipe 'ganglia'

package "ganglia-monitor" do
  action :install
end

# Enable and start the slurm service
service "ganglia-monitor" do
  action [:enable,:start]
end

# Build slurm.conf based on the template
template "/etc/ganglia/gmond.conf" do
  source "gmond.conf.erb"
  owner "ganglia"
  mode "0644"
  notifies :restart, resources(:service => "ganglia-monitor")
end
