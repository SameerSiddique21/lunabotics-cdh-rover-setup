# Assumptions and verification handoff

**This is a proposed offline architecture, not a tested rover wiring plan.**

- Base box: 0.80 × 0.55 × 0.18 m, four wheels (radius 0.12 m), nominal chassis mass 12 kg. All are **placeholders**.
- The Jetson Orin Nano 8GB and ESP32-S3 are **candidate architecture choices** from the team's earlier trade-study work; actual inventory and hardware revision require confirmation.
- Camera, LiDAR and IMU models and physical connection protocols are unspecified. Every interface in `interface_sheet.csv` is **proposed**, not finalized.
- This package contains no motor command, autonomous drive or emergency-stop implementation.
- For Vin (future hardware-only checks): confirm board inventory and power supply rating; identify sensor models and connector pinouts from datasheets; check ground/common reference; verify power OFF continuity before any energization; approve a controlled ROS node discovery/serial enumeration test. Do not connect unknown voltage rails or enable motors until Electrical and safety owners approve.

## Offline checks
1. Run `bash -n scripts/*.sh` to check shell syntax.
2. Run `./scripts/build_model.sh`, expect `URDF generated and XML parsed`.
3. Run `./scripts/start_gazebo.sh` in terminal A, expect Gazebo to open (desktop required).
4. Run `./scripts/spawn_rover.sh` in terminal B, expect a stationary concept rover to appear.
5. Take a screenshot of Gazebo and save to `evidence/`; optionally screen-record 20–40 seconds.
6. Report failures as **not yet verified** rather than claiming tests passed.

## Integration, starting Nov 2
Request confirmed rover dimensions from Mechanical; pinout, controller and voltage details from Electrical; and topic/message definitions from GNC. Revise the diagram and Xacro only after those confirmations.
