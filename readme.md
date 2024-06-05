# ozerlabs slurm 
Quick guide to setting up and running jobs on a slurm cluster (specifically at ozerlabs).  


## connect to the cluster
Presumably you already have access and can remotely connect so the cluster. By running the following command you should be able to connect to the cluster. replace `<username>` with your username and `<cluster_ip>` with the ip address of the cluster.

```bash
ssh <username>@<cluster_ip>
```


## sessions
You can either request an interactive session or submit a job to the cluster. Interactive sessions will give you a terminal through which you can run your commands using requested resources. Submitting a job will run your task in the background once when the requested resources are aquired.

1. Interactive session
    ```bash
    sinteractive -N 1 -n 1 --nodelist=nodename --gres=gpu:1 -J int_jobs_name
    ```
2. Submit a job
    ```bash
    sbatch <script_name>.sh
    ```

## Modules

There are existing modules already installed including anaconda, cuda, that can be loaded to your environment. 

you can check the modules and load them with:

```bash
# check available modules
module avail

# load a module 
module load <module_name>
```

## custom setup

Although some module are installed they might not be sufficient for your task at hand. As an example, separate python environments will certainly be needed for different tasks. Therefore we will have Miniconda downloaded and installed to work with environments with ease and more flexibility.

1. download and install Miniconda
    ```bash
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh
    ```
2. Initialize conda
    ```bash
    ~/miniconda3/bin/conda init bash
    ~/miniconda3/bin/conda init zsh
    ```
3. create a new environment
    ```bash
    # conda create -n <env_name> python=3.7
    ...
    ```
## Example
[CifarTuts](./cifarTuts/) is a simple pyTorch example that trains a CNN on the CIFAR-10 dataset. You can follow the steps below to create a new environment and run [train.py](./cifarTuts/Train.py), [test.py](./cifarTuts/Test.py) and [predict.py](./cifarTuts/predict.py) on the cluster.

1. environment setup
```bash
conda create -n cifarTuts 
conda activate cifarTuts

# install pytorch
pip3 install torch torchvision torchaudio

# install other dependencies
# pip3 install -r requirements.txt
```

2. Submit the job
```bash
cd cifarTuts
sbatch slurmJob.sh
```

## slurm
You can run any examples provided in this repository by cd'ing into the directory and running submit the job to the cluster. 
```bash
sbatch <script_name>.sh
```

## More resources
- [Quick start guide](./Slurm.md)
- [Slurm documentation](https://slurm.schedmd.com/documentation.html)
- [Slurm quick start guide](https://slurm.schedmd.com/quickstart.html)
- [Slurm tutorial](https://slurm.schedmd.com/tutorials.html)
- [Slurm job arrays](https://slurm.schedmd.com/job_array.html)
- [Ronin](https://blog.ronin.cloud/slurm-intro)
