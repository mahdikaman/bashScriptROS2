#!/bin/bash

# If something goes wrong the file will not continue executing
set -e

# Copy my_script.sh to /usr/local/bin
sudo install rosbuild/rosbuild.sh /usr/local/bin/

# Set permissions to executable
sudo chmod +x /usr/local/bin/rosbuild.sh

# Creating a symbolic link
sudo ln -s /usr/local/bin/rosbuild.sh /usr/local/bin/rosbuild

echo "Installation complete!"
