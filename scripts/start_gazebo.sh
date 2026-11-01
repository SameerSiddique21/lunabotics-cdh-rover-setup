#!/usr/bin/env bash
set -euo pipefail

set +u
source /opt/ros/humble/setup.bash
set -u

# Use software rendering for Gazebo in WSL2
export LIBGL_ALWAYS_SOFTWARE=1

# Launch Gazebo Fortress with an empty world
ros2 launch ros_gz_sim gz_sim.launch.py gz_args:="-r empty.sdf"