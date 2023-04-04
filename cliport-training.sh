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
export CLIPORT_ROOT=$(pwd)


srun python cliport/train.py train.task=towers-of-hanoi-seq-seen-colors \
                        train.agent=simple_cliport \
                        train.attn_stream_fusion_type=add \
                        train.trans_stream_fusion_type=conv \
                        train.lang_fusion_type=mult \
                        train.n_demos=10 \
                        train.n_val=10 \
                        train.n_steps=1000 \
                        train.exp_folder=exps \
                        dataset.cache=False


