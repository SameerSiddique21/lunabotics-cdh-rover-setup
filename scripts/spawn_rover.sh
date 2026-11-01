#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

set +u
source /opt/ros/humble/setup.bash
set -u

if [[ ! -f "$ROOT/build/rover.urdf" ]]; then
    "$ROOT/scripts/build_model.sh"
fi

# Spawn the conceptual rover in the running Gazebo world.
# No autonomous driving or motor controls.
ros2 run ros_gz_sim create \
    -world empty \
    -file "$ROOT/build/rover.urdf" \
    -name concept_rover \
    -z 0.25