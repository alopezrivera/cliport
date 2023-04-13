# Clone repo
git clone "https://github.com/cliport/cliport.git"

# Install Python 3.8
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.8 python3.8-dev python3.8-venv
# Make sure pip is updated
pip install --upgrade pip

# Create and activate venv
python3.8 -m venv --system-site-packages cliport_env
source cliport_env/bin/activate

# Install libjpeg to solve [Pillow] installation error:
# "The headers or library files could not be found for jpeg,
#  a required dependency when compiling Pillow from source."
sudo apt install libjpeg-dev zlib1g-dev

# Install requirements
cd cliport
pip install -r requirementsA100.txt # Or requirements.txt if >Turing GPU compatibility not required

# Final set up
export CLIPORT_ROOT=$(pwd)
python setup.py develop