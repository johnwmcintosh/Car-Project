$fn = 50;
include <../robot_settings.scad>

use <physical_ball_bearing.scad>
use <tire_apparatus.scad>
use <dc_motor_mount.scad>
use <../spring_library.scad>
use <MCAD/involute_gears.scad>
use <OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <../Front_End/axle_for_custom_hub.scad>
use <../Rear_End/rear_apparatus.scad>
use <../Front_End/Battery_box_2.scad>
use <../arc.scad>
use <lidar.scad>

        difference() {
        rotate([0,0,5])
          gear(gear_thickness = pinion_gear_width,
               number_of_teeth = pinion_gear_teeth,
               circular_pitch = gears_module * PI,
               bore_diameter = ball_bearing_inner_diameter + .05,
               pressure_angle = 20,
               clearance = 0,
               backlash = .5);
          
          translate([0,-1,-2])
          cube([ball_bearing_inner_diameter - 1, 2, 10]);
        }