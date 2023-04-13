export CLIPORT_ROOT=$(pwd)
# Generate test data for pre-trained model
python cliport/demos.py n=10 \
                        task=towers-of-hanoi-seq-seen-colors \
                        mode=test