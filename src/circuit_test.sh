srun -A d108 --time=00:02:00 --nodes=4 --ntasks-per-node=1 --cpus-per-task=12 --partition=normal --constraint=gpu ~/legion/language/regent.py circuit_sparse.rg -dm:replicate 0 -ll:cpu 10 -level runtime=5