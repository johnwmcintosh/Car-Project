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


//axle(axle_length = 30);
rotate([0,0,180])
rear_apparatus();
 