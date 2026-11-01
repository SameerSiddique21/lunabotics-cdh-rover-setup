# CDH Rover Setup — Test Results

- Host OS / machine: Ubuntu 22.04.5 LTS / WSL2
- ROS distro: Humble
- Gazebo version: Gazebo Sim 6.18.0 (Fortress)
- Installation result: PASS — Gazebo Fortress and Xacro installed
- Xacro conversion result: PASS — rover.urdf generated
- URDF validation result: PASS — check_urdf successfully parsed XML
- Gazebo launch result: PASS — empty.sdf opened using software rendering
- Model spawn result: PASS — data: true, rover appeared in Gazebo
- Initial physics test: PASS — rover remained upright and appeared to rest on its wheels
- Screenshot filenames: rover_spawn_test.png, rover_physics_test.png 
- Screen recording filename: PENDING

## Issues / Changes

- Gazebo initially displayed a black screen under WSL2.
- Resolved by using LIBGL_ALWAYS_SOFTWARE=1.
- Installed ros-humble-xacro after initial package-not-found error.
- Rover dimensions, masses, and hardware interfaces remain unverified placeholders.
- Wheel motion, driving controls, and physical hardware integration have not been tested.