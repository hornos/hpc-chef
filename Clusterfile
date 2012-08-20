# public address is not used
# cluster is distributed by a chef json
# node[:cluster] -> $cluster
# node[:host] -> :head/:c00?
$cluster = {
  :name => "hpc",

  :nodes => {
    :head => {
      :pub_addr => '10.10.10.10',
      :pri_addr => '10.10.11.10',
      :alias => 'loghost admin',
      :cpus =>1,
      :roles=>'role[slurm-headnode],
               recipe[slurm::iptraf],
               recipe[autofs::server],
               recipe[rsyslog::server],
               recipe[ganglia::client],
               recipe[ganglia::server]'
    },

    :c001 => {
      :pub_addr => '10.10.10.11',
      :pri_addr => '10.10.11.11',
      :cpus =>2,
      :roles=>'role[slurm-compnode],
               recipe[autofs::client],
               recipe[rsyslog::client],
               recipe[ganglia::client]'
    },

    :c002 => {
      :pub_addr => '10.10.10.12',
      :pri_addr => '10.10.11.12',
      :cpus =>2,
      :roles=>'role[slurm-compnode],
               recipe[autofs::client],
               recipe[rsyslog::client],
               recipe[ganglia::client]'
    }

  },

  :munge => {:key=>"0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33"},

  :nfs => { :exports => ["/scratch"] },

}
