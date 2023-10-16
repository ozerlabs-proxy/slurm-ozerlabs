#!/bin/bash

#SBATCH --job-name=ss2
#SBATCH --account=users
#SBATCH --nodes=1
#SBATCH --nodelist=nova[82]
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=main
#SBATCH --gres=gpu:1
##SBATCH --mem=20G
#SBATCH --time=15-0
#SBATCH --output=%x-%j.txt
#SBATCH --mail-type=ALL
#SBATCH --mail-user=alain.ndigande@ozu.edu.tr


#clear the module
module purge

# conda environment
source ${HOME}/.bashrc
eval "$(conda shell.bash hook)"

conda activate torchEnv

srun nvidia-smi

srun python cifar10_tutorial
# python testgpu.py

