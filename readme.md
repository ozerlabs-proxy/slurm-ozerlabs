# ozerlabs slurm 

presumable you have access to the cluster

```bash
ssh <username>@<cluster_ip>
```

## setup

There are existing modules already installed including anaconda, cuda ... 

you can check the modules and load them with

```bash

module avail
module load <module_name>
```

## custom setup

for easy setup I like to have download and install miniconda which will allow me to work with environments with ease and more flexibility.

```bash
# download miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# install miniconda
bash Miniconda3-latest-Linux-x86_64.sh
# create a new environment
# conda create -n <env_name> python=3.7
...

```
although you can manualy set up your environment, here we will basicall use existing environment yaml file to create our environment and load it.

```bash
# create a new environment from yaml file
conda env create -f environment.yaml
conda activate cifarTuts
```

## slurm

```bash
sbatch <script_name>.sh
```