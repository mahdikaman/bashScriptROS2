#!/bin/bash

set -e

usage() {
  echo "Usage: rosbuild [OPTION]..."
  echo "Build tool for a ROS 2 workspace"
  echo ""
  echo -e "  -c, --clean\tCleans the workspace"
  echo -e "  -h, --help\tShow this help message and exit"
}

clean(){
  rm -rf install/ build/ log
}

while getopts "ch-:" option; do
    case "${option}" in
        c) clean;;
        h) usage; exit;;
        -) case "${OPTARG}" in
        	help) usage; exit;;
        	clean) clean; exit;;
        	*) echo "Invalid option: --${OPTARG}" >&2; exit 1;;
           esac;;
        \?) echo "Invalid option: -${OPTARG}" >&2; exit 1;;
        :) echo "Option -${OPTARG} requires an argument." >&2; exit 1;;
    esac
done

colcon build;
echo "Sourcing install/setup.bash";
source install/setup.bash;

