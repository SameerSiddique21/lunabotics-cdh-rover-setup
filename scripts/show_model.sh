#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source /opt/ros/humble/setup.bash
"$ROOT/scripts/build_model.sh"
ros2 run robot_state_publisher robot_state_publisher --ros-args -p robot_description:="$(cat "$ROOT/build/rover.urdf")"
