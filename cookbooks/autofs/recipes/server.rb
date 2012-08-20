# Recipe for a cluster head node with an NFS share

# Install NFS packages
package("nfs-common")
package("nfs-kernel-server")

cluster=node[:cluster]
# Make sure the diretory to be exported exists
cluster[:nfs][:exports].each do |d|
  directory d do
    mode "0777"
    action :create
  end
end

# Create the exports file and refresh the NFS exports
template "/etc/exports" do
  source "exports.erb"
  owner "root"
  group "root"
  mode "0644"
end

# Start the NFS server
service "nfs-kernel-server" do
  action [:enable,:start,:restart]
end


execute "exportfs" do
  command "exportfs -a"
  action :run
end
