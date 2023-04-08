export CLIPORT_ROOT=$(pwd)
# Train full model on towers of hanoi problem
python cliport/train.py train.task=towers-of-hanoi-seq-seen-colors \
                        train.agent=cliport \
                        train.attn_stream_fusion_type=add \
                        train.trans_stream_fusion_type=conv \
                        train.lang_fusion_type=mult \
                        train.n_demos=10 \
                        train.n_val=10 \
                        train.n_steps=10000 \
                        train.exp_folder=exps \
                        dataset.cache=False