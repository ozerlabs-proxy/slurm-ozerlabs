#!/bin/bash
#
# TODO:
#   - Set name of the job below changing value.
#   - Set the requested number of nodes (servers) with --nodes parameter.
#   - Set the requested number of tasks (cpu cores) with --ntasks parameter. (Total accross all nodes)
#   - Set the required time limit for the job with --time parameter.
#     - Acceptable time formats include "minutes", "minutes:seconds", "hours:minutes:seconds", "days-hours", "days-hours:minutes" and "days-hours:minutes:seconds"
#   - Put this script and all the input file under the same directory.
#   - Set the required parameters, input/output file names below.
#   - If you do not want mail please remove the line that has --mail-type and --mail-user. If you do want to get notification emails, set your email address.
#   - Put this script and all the input file under the same directory.
#   - Submit this file using:
#      sbatch slurm_submit.sh
#
# -= Resources =-
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

INPUT_FILE=""

###########################
###########################

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

echo "Running Example Job...!"

echo "--------"
srun python example.py 

# run any commands with srun