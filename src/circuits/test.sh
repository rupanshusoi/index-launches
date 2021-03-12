#!/bin/sh
#SBATCH -A d108
#SBATCH --time=00:02:00
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=12
#SBATCH --partition=normal
#SBATCH --constraint=gpu
#SBATCH --output=/dev/null

for n in $SLURM_JOB_NUM_NODES; do
  time srun -n $n -N $n --cpu-bind=none ~/index-launches/src/circuits/circuit.dcr_idx -npp 2500 -wpp 10000 -l 50 -p 512 -pps $(( 512 / n )) -prune 30 -hl:sched 1024 -ll:gpu 1 -ll:util 2 -ll:pin_util -ll:dma 2 -ll:csize 5000 -ll:fsize 5000 -ll:zsize 2048 -ll:rsize 512 -ll:gsize 0 -level 5 -dm:same_address_space -dm:memoize | tee s_dcr_idx_"$n".log
done
