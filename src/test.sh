#SBATCH -A d108
#SBATCH --time=00:20:00
#SBATCH --nodes=2
#SBATCH --ntasks=1
#SBATCH --cpu-bind=none
#SBATCH --partition=normal
#SBATCH --constraint=gpu

env SAVEOBJ=1 ~/legion/language/regent.py circuit_sparse.rg
time srun out -hl:sched 1024 -ll:csize 4196 -dm:same_address_space 1 -ll:cpu 4 -ll:util 2 -level 5
