#!/bin/bash

#SBATCH --job-name=cifar
#SBATCH --account=users
#SBATCH --nodes=1
##SBATCH --nodelist=nova[32,82,83,101,102]
#SBATCH --nodelist=nova[82]
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --partition=main
#SBATCH --gres=gpu:1
##SBATCH --mem=20G
#SBATCH --time=15-0
#SBATCH --output=slurm_logs/%x-%j.txt



echo "---- env ! ----"
ulimit -s unlimited
ulimit -l unlimited
ulimit -a

echo "------- setup done ! -----"
# load the python interpreter
# clear the module
# module purge
# module load cuda/11.7

## conda environment
source ${HOME}/.bashrc
eval "$(conda shell.bash hook)"
conda activate cifarTuts

srun nvidia-smi

echo "--**cifar**--"
srun python Train.py 
srun python Test.py 
srun python predict.py


