# TODO: munge dep

# Install packages
%w{slurm-llnl slurm-llnl-torque slurm-llnl-basic-plugins slurm-llnl-basic-plugins-dev}.each do |pkg|
  package pkg do
    action [:install]
  end
end

# SLURM configuration

# Create the slurm user based on settings
user("slurm")

# Make sure the config directory exists
directory "/etc/slurm-llnl" do 
  owner "root"
  group "root"
  mode "0755"
  action :create
end

# Build slurm.conf based on the template
template "/etc/slurm-llnl/slurm.conf" do
  source "slurm.conf.erb"
  owner "slurm"
  mode "0755"
  notifies :run, "execute[reconfigure]"
end

# Enable and start the slurm service
service "slurm-llnl" do
  action [:enable,:start]
end

execute "reconfigure" do 
  command "sudo scontrol reconfigure"
  action :nothing
  not_if { node[:host][:roles] =~ /compnode/ }
end

