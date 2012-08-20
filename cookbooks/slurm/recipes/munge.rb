# Install packages
%w{munge}.each do |pkg|
  package pkg do
    action [:install]
  end
end

# Make sure the munge user exists
user("munge")

# Make sure /etc/munge directory exists
directory "/etc/munge" do
  action :create
  owner "munge"
end

# Make /etc have suitable permissions ?
directory "/etc" do
  mode "0755"
end

# Create the munge key from template
template "/etc/munge/munge.key" do
  source "munge.key.erb"
  owner "munge"
end

# Enable and start the munge service
service "munge" do
  action [:enable,:start]
end
