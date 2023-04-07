export CLIPORT_ROOT=$(pwd)
# Datasets required: train, test, val
# -----------------------------------
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