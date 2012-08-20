
user("ganglia")

# private network if
# mif = node[:cluster][:ganglia][:multicast] || "eth2"
# execute 'multicast' do
#   command "sudo route add -host 239.2.11.71 dev #{mif}"
#   action :run
#   # todo: better check
#   ignore_failure true
# end

# Make sure the config directory exists
directory "/etc/ganglia" do 
  owner "ganglia"
  mode "0755"
  action :create
end

