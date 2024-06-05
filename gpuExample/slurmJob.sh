#!/bin/bash
#
#SBATCH --job-name=Slurm-Test
#SBATCH --account=users
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --partition=main
#SBATCH --gres=gpu:1
#SBATCH --time=2-0
#SBATCH --output=%j-slurm.out
#SBATCH --mail-type=ALL
##SBATCH --mail-user=example@ozu.edu.tr

# Module File
echo "Loading modules"
module purge
module load python
module load cuda/10.1


# Set stack size to unlimited
echo "Setting stack size to unlimited..."
ulimit -s unlimited
ulimit -l unlimited
ulimit -a
echo

echo "GPU availability test!"

echo "--------"
srun python example.py 

# run any commands with srun

echo "---------gpu Availability----"
srun python gpuAvailable.py 

# echo "---------gpu Allocation-------"
# srun python gpuAllocation.py 
