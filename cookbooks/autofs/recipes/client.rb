package "nfs-common"
package "autofs"

service "autofs" do
  supports [ :start, :stop, :restart, :reload, :status ]
  action [ :enable, :start ]
end

template "/etc/auto.master" do
  source "auto.master.erb"
  owner "root"
  group "root"
  mode "0644"
  notifies :reload, resources(:service => "autofs"), :immediately
end
