include <../robot_settings.scad>

use <../Front_End/robot_rail.scad>
use <../Front_End/tire_apparatus.scad>
use <../Front_End/tire_rim.scad>
use <../Front_End/dc_motor_mount.scad>
use <../Front_End/axle_for_custom_hub.scad>
use <../Front_End/MCAD/involute_gears.scad>
use <../Front_End/OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <../Front_End/Battery_box_2.scad>
use <dc_motor.scad>
use <../spring_library.scad>

use <rear_apparatus.scad>
use <apparatus_peg.scad>
use <power_bar.scad>
use <drv8871.scad>
use <drv8871mount.scad>
$fn = 50;


translate([0, 20, 0])
rotate([0, 90, 0])
apparatus_peg();

//axle(axle_length = 30, rear_axle = true);