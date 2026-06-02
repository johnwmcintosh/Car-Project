include <../robot_settings.scad>

use <physical_ball_bearing.scad>
use <full_apparatus.scad>
use <dc_motor_mount.scad>
use <../Rear_End/dc_motor.scad> 
use <pull_bar.scad>
use <steering_rack.scad>

$fn = 50;

module front_robot_rail(
  show_steering_apparatus = true,
  show_jackstand = false
 ){
 
  difference() {
        // rail
        //
      translate([-rail_width / 2, -rail_length /2, 0])
        cube([
          rail_width - rail_gap * wall_thickness, 
          rail_length, 
          rail_thickness], 
          center = false
        );
          
       // right attachment cutouts for extension
      translate([-20,  rail_length / 2 - 5, 1])
      cylinder(h = 2 * rail_thickness, d = 3, center = true);

       // left attachment cutouts for extension
      translate([20,  rail_length / 2 - 5, 1])
      cylinder(h = 2 * rail_thickness, d = 3, center = true);
    
      // right cutout for apparatus
      translate([rail_width / 2 - 3 *  ball_bearing_height, 102, -1])
      cylinder(h = 20, d = ball_bearing_outer_diameter + .6);
    
      // left cutout for apparatus
      translate([-rail_width / 2 + 3 *  ball_bearing_height, 102, -1])
      cylinder(h = 20, d = ball_bearing_outer_diameter + .5);
      
      // stress relief for left
      translate([-rail_width / 2 + 3 * ball_bearing_height, 100 - ball_bearing_outer_diameter / 2, -1])
      cube([2, ball_bearing_outer_diameter + 4, 10]); 

      translate([-rail_width / 2 + ball_bearing_height + .5, 101.5, -1])
      cube([ball_bearing_outer_diameter + 4, 2, 10]); 
      
      // stress relief for right
      translate([rail_width / 2 - 3 * ball_bearing_height, 100 - ball_bearing_outer_diameter / 2, -1])
      cube([2, ball_bearing_outer_diameter + 4, 10]); 

      translate([rail_width / 2 -  1.5 * ball_bearing_outer_diameter - 1, 101.5, -1])
      cube([ball_bearing_outer_diameter + 4, 2, 10]);
      }
 
      
     translate([rail_width / 2 - 30, 123.5, 3.5])
     rotate([0, 90, 0])
     cylinder(h = 20, d = rail_thickness);
     
     translate([-rail_width / 2 + 10 , 123, 3.5])
     rotate([0, 90, 0])
     cylinder(h = 20, d = rail_thickness);
     
    if (show_steering_apparatus) {
        translate([0, main_box_y, -43])
        full_apparatus();
    }
 
    if (show_jackstand)
    {
      translate([0, rail_length / 2 + 5.5, -108])
      rotate([0,0, 180])
        front_end_jack();
    }

}

front_robot_rail();