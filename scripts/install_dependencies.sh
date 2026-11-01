
#!/usr/bin/env bash
set -euo pipefail

if [[ "$(lsb_release -rs)" != "22.04" ]]; then
    echo "Designed for Ubuntu 22.04; aborting."
    exit 1
fi

if [[ ! -f /opt/ros/humble/setup.bash ]]; then
    echo "Install ROS 2 Humble first using official ROS documentation."
    exit 1
fi

sudo apt-get update

sudo apt-get install -y \
    ignition-fortress \
    python3-colcon-common-extensions \
    python3-rosdep \
    ros-humble-xacro \
    ros-humble-robot-state-publisher \
    ros-humble-joint-state-publisher \
    ros-humble-ros-gz-sim \
    ros-humble-rviz2

printf '\nProject dependencies installed successfully.\n'
