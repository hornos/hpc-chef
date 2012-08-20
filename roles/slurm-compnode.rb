name "slurm-compnode"
description "SLURM cluster compute node"
run_list(
  "recipe[slurm::hosts]",
  "recipe[slurm::munge]",
  "recipe[slurm::slurm]",
  "recipe[slurm::openmpi]"
)

