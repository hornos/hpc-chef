name "slurm-headnode"
description "SLURM cluster headnode"
run_list(
  "recipe[slurm::hosts]",
  "recipe[slurm::munge]",
  "recipe[slurm::slurm]",
  "recipe[slurm::openmpi]",
  "recipe[slurm::pdsh]"
)
