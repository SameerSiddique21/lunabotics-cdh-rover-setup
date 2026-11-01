
# Lunabotics CDH — Jetson & Rover Setup (Sameer + Zosia)

**Week 1 Combined Offline Project (October 26–30, 2026)**

This project provides an initial ROS 2 and Gazebo simulation setup for the TAMU Lunabotics rover. It includes reproducible installation and startup scripts, a conceptual URDF/Xacro rover model, and proposed Jetson-to-sensor/controller interfaces.

The project was tested locally using Ubuntu 22.04 and ROS 2 Humble. Physical hardware connections and rover dimensions have not been verified.

## Project Files

- `scripts/install_dependencies.sh` — Installs required ROS 2 and Gazebo packages.
- `scripts/build_model.sh` — Converts the Xacro model to URDF and checks the generated XML.
- `scripts/start_gazebo.sh` — Launches Gazebo Fortress with an empty simulation world.
- `scripts/spawn_rover.sh` — Spawns the conceptual rover in Gazebo.
- `scripts/show_model.sh` — Publishes the rover's robot description.
- `models/rover.urdf.xacro` — Initial four-wheel rover model with a chassis and sensor mast.
- `docs/connection_diagram.svg` — Proposed Jetson, sensor, and controller connections.
- `docs/interface_sheet.csv` — Proposed communication interfaces and verification status.
- `docs/assumptions_and_test_plan.md` — Design assumptions, testing procedures, and hardware verification requirements.
- `evidence/` — Test results, screenshots, and simulation recording.
- `requirements.txt` — Software dependency information.

## System Requirements

The project was developed and tested with:

- Ubuntu 22.04.5 LTS (WSL2)
- ROS 2 Humble
- Gazebo Fortress (Gazebo Sim 6.18.0)
- Python 3
- Xacro
- ros_gz_sim
- VS Code

ROS 2 Humble must already be installed before running the dependency installation script.

## Installation

Open a terminal in the project folder.

Make the scripts executable:

```bash
chmod +x scripts/*.sh
```

Install the project dependencies:

```bash
./scripts/install_dependencies.sh
```

Build the rover model:

```bash
./scripts/build_model.sh
```

The build script generates `build/rover.urdf` from the Xacro model and validates the generated XML.

## Running the Rover Simulation

### Step 1: Start Gazebo

Open Terminal 1 and run:

```bash
./scripts/start_gazebo.sh
```

Gazebo Fortress should open with an empty simulation world.

### Step 2: Spawn the Rover

Keep Gazebo open.

Open Terminal 2 in the project folder and run:

```bash
./scripts/spawn_rover.sh
```

The rover should appear in Gazebo under the name `concept_rover`.

### Step 3: Run the Simulation

Click the Play button in Gazebo to start the physics simulation.

The rover should remain upright and settle on its wheels.

The current model does not include motor controls or autonomous driving capabilities.

## Local Verification Results — November 1, 2026

The following tests were completed on Ubuntu 22.04.5 LTS using WSL2.

| Test | Result |
|---|---|
| ROS 2 Humble environment | PASS |
| Gazebo Fortress installation | PASS |
| Xacro conversion to URDF | PASS |
| URDF structural validation | PASS |
| Bash script syntax checks | PASS |
| build_model.sh execution | PASS |
| start_gazebo.sh execution | PASS |
| spawn_rover.sh execution | PASS |
| Rover spawning in Gazebo | PASS |
| Initial physics simulation | PASS |
| Physical hardware verification | NOT TESTED |

The rover successfully appeared in Gazebo, and the initial physics test showed it remaining upright and apparently resting on its wheels.

Wheel actuation, navigation, sensor operation, and physical rover integration have not been tested.

## WSL2 Graphics Troubleshooting

Gazebo initially displayed a black screen when launched through WSL2.

The issue was resolved by enabling software rendering:

```bash
LIBGL_ALWAYS_SOFTWARE=1 ign gazebo empty.sdf
```

The `start_gazebo.sh` script includes this environment setting to support the tested WSL2 configuration.

The software-rendering workaround may not be necessary on other computers.

## Test Evidence

The following files document local simulation testing:

- `evidence/rover_spawn_test.png` — Screenshot of the rover successfully spawned in Gazebo.
- `evidence/rover_physics_test.png` — Screenshot showing the rover during the physics simulation.
- `evidence/rover_gazebo_demo.mp4` — Short screen recording of the rover in Gazebo.
- `evidence/TEST_RESULTS_TEMPLATE.md` — Local testing results and observations.

## Proposed Hardware Architecture

The conceptual design includes:

- NVIDIA Jetson Orin Nano — Proposed main ROS 2 computer.
- ESP32-S3 — Proposed secondary controller.
- Camera — Proposed visual sensing.
- LiDAR — Proposed distance and obstacle sensing.
- IMU — Proposed orientation and motion sensing.
- Motor controllers — Proposed drive-system interfaces.
- Ground station — Proposed operator communication.

The proposed connections are documented in `docs/connection_diagram.svg` and `docs/interface_sheet.csv`.

These are conceptual interfaces based on preliminary architecture decisions and previous Lunabotics reference material. They have not been verified against the current rover hardware.

## Design Assumptions and Limitations

The initial rover model uses the following placeholder parameters:

- Chassis length: 0.80 m
- Chassis width: 0.55 m
- Chassis height: 0.18 m
- Wheel radius: 0.12 m
- Wheel width: 0.06 m
- Chassis mass: 12 kg

All dimensions, masses, wheel placements, and inertial properties are provisional.

Additional limitations:

- No autonomous navigation or driving functionality is implemented.
- No physical motor or sensor integration has been performed.
- Communication protocols, pin assignments, and power requirements remain unverified.
- The initial model is intended for simulation and interface planning.
- The connection diagram must not be used as a physical wiring schematic.

## Future Integration and Testing

Starting November 2, the CDH team will begin integrating the individual projects.

Future work includes:

1. Confirming rover dimensions and geometry with Mechanical.
2. Confirming motor controllers, wiring, and electrical interfaces with Electrical.
3. Coordinating ROS 2 topics and commands with GNC.
4. Updating the URDF/Xacro model using confirmed rover dimensions.
5. Integrating sensor data and motor-control interfaces.
6. Testing combined software functionality in Gazebo.
7. Preparing physical Jetson and sensor verification procedures for Vin.

Physical hardware testing will require approved test procedures, expected results, and safety precautions.

## Project Status

The initial ROS 2/Gazebo setup and rover model have been successfully demonstrated locally.

The installation, model-generation, startup, and rover-spawning workflows have been tested on the development computer, although the complete dependency installer has not been independently verified on a fresh Ubuntu installation.

The project provides an initial foundation for future CDH software and hardware integration.

**Developed for TAMU Lunabotics CDH — Sameer and Zosia.**
