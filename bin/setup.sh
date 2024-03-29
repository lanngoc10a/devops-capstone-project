#!/bin/bash
echo "****************************************"
echo " Setting up Capstone Environment"
echo "****************************************"

echo "Installing Python 3.10 and Virtual Environment package"
sudo apt update
sudo apt install -y python3.10 python3.10-venv

echo "Creating a Python virtual environment"
python3.10 -m venv ~/venv

echo "Configuring the developer environment..."
echo "# DevOps Capstone Project additions" >> ~/.bashrc
echo "export GITHUB_ACCOUNT=$GITHUB_ACCOUNT" >> ~/.bashrc
echo 'export PS1="\[\e]0;\u:\W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "' >> ~/.bashrc
echo "source ~/venv/bin/activate" >> ~/.bashrc

echo "Installing Python dependencies..."
source ~/venv/bin/activate && python3.10 -m pip install --upgrade pip wheel
source ~/venv/bin/activate && pip install -r requirements.txt

echo "Removing existing Postgres Docker container (if any)..."
docker rm -f postgresql

echo "Starting the Postgres Docker container..."
# Run the container
make db

echo "Checking the Postgres Docker container..."
docker ps

echo "****************************************"
echo " Capstone Environment Setup Complete"
echo "****************************************"
echo ""
echo "Use 'exit' to close this terminal and open a new one to initialize the environment"
echo ""
