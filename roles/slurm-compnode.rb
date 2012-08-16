name "slurm-compnode"
description "SLURM cluster compute node"
run_list(
  "recipe[slurm-mpi-cluster::munge]",
  "recipe[slurm-mpi-cluster::slurm]",
  "recipe[slurm-mpi-cluster::nfs_compnode]",
  "recipe[slurm-mpi-cluster::openmpi]"
)
