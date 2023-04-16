export CLIPORT_ROOT=$(pwd)

N_DEMOS=${1:-1} # Script argument, defaulting to 1
N_EPOCHS=20000

echo "============================================"
echo "    Starting training and evaluation of"
echo "             FULL CLIPORT MODEL"
echo "                     for"
echo "   ~ towers-of-hanoi-seq-unseen-colors ~"
echo "                    with:"
echo "               n_demos  = ${N_DEMOS}"
echo "               n_epochs = ${N_EPOCHS}"
echo "============================================"

sleep 1

# Train full model on towers of hanoi problem
python cliport/train.py train.task=towers-of-hanoi-seq-unseen-colors \
                        train.agent=cliport \
                        train.attn_stream_fusion_type=add \
                        train.trans_stream_fusion_type=conv \
                        train.lang_fusion_type=mult \
                        train.n_demos=${N_DEMOS} \
                        train.n_val=${N_DEMOS} \
                        train.n_steps=${N_EPOCHS} \
                        train.exp_folder=exps \
                        dataset.cache=False | tee -a reproduction_logs/cliport_full_unseen_train_n${N_DEMOS}.txt

# Evaluate full model on towers of hanoi problem
python cliport/eval.py eval_task=towers-of-hanoi-seq-unseen-colors \
                       agent=cliport \
                       mode=val \
                       n_demos=10 \
                       train_demos=${N_DEMOS} \
                       checkpoint_type=val_missing \
                       exp_folder=exps | tee -a reproduction_logs/cliport_full_unseen_eval_n${N_DEMOS}.txt