export CLIPORT_ROOT=$(pwd)
# Generate test data for pre-trained model
python cliport/demos.py n=10 \
                        task=stack-block-pyramid-seq-seen-colors \
                        mode=test