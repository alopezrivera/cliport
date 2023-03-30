#!/bin/sh

#SBATCH --job-name="cliport-training"
#SBATCH --partition=gpu
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --gpus=1
#SBATCH --mem=12G
#SBATCH --account=research-ae-spe

module load 2022r2
module load python/3.8
source cliport_env/bin/activate

srun <name_of_module> 


