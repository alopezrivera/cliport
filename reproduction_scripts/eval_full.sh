export CLIPORT_ROOT=$(pwd)
# Evaluate full model on towers of hanoi problem
python cliport/eval.py eval_task=towers-of-hanoi-seq-seen-colors \
                       agent=cliport \
                       mode=val \
                       n_demos=10 \
                       train_demos=10 \
                       checkpoint_type=val_missing \
                       exp_folder=exps