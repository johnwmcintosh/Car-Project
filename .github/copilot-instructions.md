# AI Agent Instructions for Car Project

## Project Overview
This is an OpenSCAD-based robotics car project with modular components organized in development phases. The project focuses on creating 3D-printable parts for a robotic car platform.

## Project Structure
- `Phase 1A/` - Current active development phase
  - `Front_End/` - Front chassis components
  - `Rear_End/` - Rear chassis components
  - `robot_settings.scad` - Global configuration and measurements
  - `spring_library.scad` - Reusable spring components

## Key Design Patterns

### Configuration Management
- All global measurements and parameters are centralized in `robot_settings.scad`
- Use `include <../robot_settings.scad>` to access global settings
- Use `use <...>` for importing component modules

### Component Organization
1. Front-end components:
   - Main assembly in `robot_rail.scad`
   - Supporting components: `tire_apparatus.scad`, `dc_motor_mount.scad`
   
2. Rear-end components:
   - Main assembly in `rear_apparatus.scad`
   - Supporting components: `drv8871mount.scad`, `power_bar.scad`

### External Dependencies
- MCAD library for gear generation (`MCAD/involute_gears.scad`)
- OpenSCAD Gear Library with Customizer for additional gear options

### Design Conventions
1. Modular Design:
   - Each mechanical component is in its own .scad file
   - Components use parameters from `robot_settings.scad` for consistency
   
2. Preview Parameters:
   - Use `$fn = 50` for development
   - Adjust for final rendering quality

3. File Outputs:
   - Development test prints use prefix `test_` (e.g., `test_print_rail.stl`)
   - Final components output directly with descriptive names

## Common Operations
- Test prints should be exported as .stl files
- Use .3mf format for specialized print settings
- Component modules should include optional display parameters (e.g., `show_steering_apparatus = true`)

## Key Integration Points
- Ball bearing interfaces (see `physical_ball_bearing.scad`)
- Motor mounting points (see `dc_motor_mount.scad`, `stepper_motor_mount.scad`)
- Power system integration (see `Battery_box_2.scad`, `drv8871mount.scad`)