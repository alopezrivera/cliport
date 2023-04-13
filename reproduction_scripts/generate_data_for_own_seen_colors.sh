export CLIPORT_ROOT=$(pwd)
# Datasets required: train, test, val
# -----------------------------------
# train
python cliport/demos.py n=10 \
                        task=towers-of-hanoi-seq-seen-colors \
                        mode=train
# val
python cliport/demos.py n=10 \
                        task=towers-of-hanoi-seq-seen-colors \
                        mode=val
# test
python cliport/demos.py n=10 \
                        task=towers-of-hanoi-seq-seen-colors \
                        mode=test