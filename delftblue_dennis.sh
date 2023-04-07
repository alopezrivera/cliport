#!/bin/sh

#SBATCH --job-name="cliport-training"
#SBATCH --partition=gpu
#SBATCH --time=01:00:00
#SBATCH --ntasks=1
#SBATCH --gpus=1
#SBATCH --mem=12G
#SBATCH --account=research-eemcs-diam

module load 2022r2
module load python/3.8
source cliport_env/bin/activate
export CLIPORT_ROOT=$(pwd)
python setup.py develop

# Generate data
# -------------
# train
python cliport/demos.py n=100 \
                        task=towers-of-hanoi-seq-seen-colors \
                        mode=train
python cliport/demos.py n=100 \
                        task=towers-of-hanoi-seq-unseen-colors \
                        mode=train
# val
python cliport/demos.py n=100 \
                        task=towers-of-hanoi-seq-seen-colors \
                        mode=val
python cliport/demos.py n=100 \
                        task=towers-of-hanoi-seq-unseen-colors \
                        mode=val
# test
python cliport/demos.py n=100 \
                        task=towers-of-hanoi-seq-seen-colors \
                        mode=test
python cliport/demos.py n=100 \
                        task=towers-of-hanoi-seq-unseen-colors \
                        mode=test

# Train
# -----
srun python cliport/train.py train.task=towers-of-hanoi-seq-seen-colors \
                        train.agent=cliport \
                        train.attn_stream_fusion_type=add \
                        train.trans_stream_fusion_type=conv \
                        train.lang_fusion_type=mult \
                        train.n_demos=10 \
                        train.n_val=10 \
                        train.n_steps=1000 \
                        train.exp_folder=exps \
                        dataset.cache=False

# Test
# ----
python cliport/eval.py eval_task=towers-of-hanoi-seq-seen-colors \
                       agent=simple_cliport \
                       mode=val \
                       n_demos=100 \
                       train_demos=100 \
                       checkpoint_type=val_missing \
                       exp_folder=exps