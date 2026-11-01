#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
set +u
source /opt/ros/humble/setup.bash
set -u
mkdir -p "$ROOT/build"
ros2 run xacro xacro "$ROOT/models/rover.urdf.xacro" -o "$ROOT/build/rover.urdf"
python3 - "$ROOT/build/rover.urdf" <<'PYIN'
import sys,xml.etree.ElementTree as ET
root=ET.parse(sys.argv[1]).getroot()
assert root.tag == 'robot'
assert len(root.findall('link')) >= 5
print('URDF generated and XML parsed:',sys.argv[1])
PYIN
