#!/bin/bash

#SBATCH --job-name=tfTest      ## Name of the job
#SBATCH --output=res-%j.out    ## Output file
#SBATCH --time=10:00           ## Job Duration
#SBATCH --ntasks=1             ## Number of tasks (analyses) to run
#SBATCH --cpus-per-task=1      ## The number of threads the code will use
#SBATCH --mem-per-cpu=500M     ## Real memory(MB) per CPU required by the job.

## Load the python interpreter
module purge
module load python


echo $USER

## run tasks
srun python script.py