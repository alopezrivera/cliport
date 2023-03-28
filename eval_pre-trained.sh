# Evaluate pre-trained model
python cliport/eval.py model_task=multi-language-conditioned \
                       eval_task=stack-block-pyramid-seq-seen-colors \
                       agent=cliport \
                       mode=test \
                       n_demos=10 \
                       train_demos=1000 \
                       exp_folder=cliport_quickstart \
                       checkpoint_type=test_best \
                       update_results=True \
                       disp=True