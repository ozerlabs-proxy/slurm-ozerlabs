#!/bin/bash
#
#
# Example job submission script
#
# TODO:
#   - Set name of the job below changing "Slurm" value.
#   - Set the requested number of tasks (cpu cores) with --ntasks parameter.
#   - Set the required time limit for the job with --time parameter.
#   - Put this script and all the input file under the same directory.
#   - Set the required parameters, input and output file names below.
#   - If you do not want mail please remove the line that has --mail-type
#   - Put this script and all the input file under the same directory.
#   - Submit this file using:
#      sbatch slurm_example.sh

# -= Resources =-
#
#SBATCH --job-name=Jupyter
#SBATCH --account=users
#SBATCH --nodes=1
#SBATCH --ntasks=2
#SBATCH --mem=20G
#SBATCH --partition=main
#SBATCH --output=jupyter-%j.out
#SBATCH --mail-type=ALL
# #SBATCH --gres=gpu:1
# #SBATCH --mail-user=foo@bar.com

################################################################################
##################### !!! DO NOT EDIT BELOW THIS LINE !!! ######################
################################################################################

## Load Anaconda
echo "Activating Anaconda..."
module load anaconda-1.0

echo ""
echo "========================================================"
env
echo "========================================================"
echo ""

# Set stack size to unlimited
echo "Setting stack size to unlimited..."
ulimit -s unlimited
ulimit -l unlimited
ulimit -a
echo

echo "Running Jupyter Notebook..!"
echo "============================"

# get tunneling info
XDG_RUNTIME_DIR=""
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(whoami)
cluster=$(hostname -f | awk -F"." '{print $2}')

### print tunneling instructions to jupyter-log-{jobid}.txt
echo -e "

    MacOS or linux terminal command to create your ssh tunnel
    -----------------------------------------------------------------
    ssh -N -L ${port}:${node}:${port} ${user}@${cluster}ozerlabsIP
    -----------------------------------------------------------------

    Windows MobaXterm info
    Forwarded port:same as remote port
    Remote server: ${node}
    Remote port: ${port}
    SSH server: ${cluster}ozerlabsIP
    SSH login: $user

    Use a Browser on your local machine to go to:
    localhost:${port}  (prefix w/ https:// if using password)
"

# load modules or conda environments here
# uncomment the following two lines to use your conda environment called notebook_env
# module load miniconda
# source activate notebook_env

# DON'T USE ADDRESS BELOW.
# DO USE TOKEN BELOW
### Start an ipcluster instance and launch jupyter server
jupyter-notebook --no-browser --port=${port} --ip=${node}

