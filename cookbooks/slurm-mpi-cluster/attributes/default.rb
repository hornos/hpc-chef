# SLURM attributes

default['slurm']['master']         = "head"
default['slurm']['master_addr']    = "10.10.10.10"
default['slurm']['computes']       = [ "c01", "c02" ]
default['slurm']['compute_addrs']  = [ "10.10.10.11", "10.10.10.12" ]

ips = default['slurm']['compute_addrs'] << default['slurm']['master_addr']
names = default['slurm']['computes'] << default['slurm']['master']

default['slurm']['hosts'] = Hash[ips.zip names]

default['slurm']['part_name']      = "batch"
default['slurm']['user']           = "slurm"
default['slurm']['cpus']           = "1"

# MUNGE attributes
# http://code.google.com/p/munge/wiki/InstallationGuide
# echo -n "foo" | sha1sum | cut -d' ' -f1
default['munge']['key']    = "0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33"

# NFS share attributes
default['nfs']['headnode_addr']    = default['slurm']['master_addr']
default['nfs']['shared_dirs']      = ["/scratch"]
default['nfs']['clients']          = default['slurm']['compute_addrs']

