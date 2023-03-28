# Clone repo
git clone "https://github.com/cliport/cliport.git"
cd cliport

# Install Python 3.8
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.8 python3.8-dev python3.8-venv
# Make sure pip is updated
pip install --upgrade pip

# Create and activate venv
python3.8 -m venv --system-site-packages cliport_env
source cliport_env/bin/activate

# Install requirements
pip install -r requirements.txt

# Final set up
export CLIPORT_ROOT=$(pwd)
python setup.py develop