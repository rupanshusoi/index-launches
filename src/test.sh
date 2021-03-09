env SAVEOBJ=1 ~/legion/language/regent.py circuit_sparse.rg
time srun -A d108 --time=00:05:00 --nodes=8 --ntasks-per-node=1 --cpus-per-task=12 --cpu-bind=none --partition=normal --constraint=gpu out -ll:csize 4196 -dm:replicate 1 -dm:same_address_space 1 -ll:cpu 8 -level runtime=5
