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
use <../apparatus_pegs.scad>
use <power_bar.scad>
use <drv8871.scad>
use <drv8871mount.scad>
$fn = 50;

        difference() {
          zahnstange(rack_module, rack_length, rack_height, rack_width);

           translate([-rack_length / 2, rack_width /2 - 4 * pull_bar_peg_r , rack_height /2 - pull_bar_peg_r])
          cube(2 * pull_bar_peg_r);
          
           translate([rack_length / 2 - 2 * pull_bar_peg_r + .75, rack_width /2 - 4 * pull_bar_peg_r , rack_height - pull_bar_peg_r - 5])
          cube(2 * pull_bar_peg_r);     
          }

//axle(axle_length = 30, rear_axle = true);