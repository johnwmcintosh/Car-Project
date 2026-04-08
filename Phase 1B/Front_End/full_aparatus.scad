include <../robot_settings.scad>

use <tire_apparatus.scad>
use <../Rear_End/dc_motor.scad> 
$fn = 50;

module full_apparatus(show_just_one = false)
{
  translate([0, 25, 15])
  rotate([0, 0, -90])
  dc_motor();
  
  difference() {
    translate([-main_box_x + ball_bearing_height , 0,0])
      rotate([0, 180, 0])
        color("yellow")
        tire_apparatus(include_ball_bearing = false, include_axle = false);

      translate([-main_box_x + ball_bearing_height / 2,  0, 27])
      cylinder(20, d = ball_bearing_height - 1, center = true);
      
      translate([-main_box_x + ball_bearing_height /2, -35, 15])
      cylinder(20, d = ball_bearing_height -1, center = true);
    }

    
if (!show_just_one) {

      // left aparatus
      difference() {
        translate([main_box_x- ball_bearing_height, 0,0])
        tire_apparatus(include_ball_bearing = false, include_axle = false, axle_rotation = true);
      
        translate([main_box_x - ball_bearing_height / 2,  0, 27])
        cylinder(20, d = ball_bearing_height - 1, center = true);
        
        translate([main_box_x - ball_bearing_height / 2, -35, 15])
        cylinder(20, d = ball_bearing_height -1, center = true);
        }
        
    difference() {
        // cross aparatus connector
        translate([- main_box_x, -5, 27])
          cube([2 * main_box_x, 10, 3]);
        
        translate([main_box_x - ball_bearing_height / 2, 0, 27])
        cylinder(h=10, d = 3, center = true);
        
        translate([-main_box_x + ball_bearing_height / 2,  0, 27])
              cylinder  (h = 10, d = 3, center = true);
    }

    
    translate([0, -20, -7])
        difference() {
            // cross aparatus connector
            translate([- main_box_x, -35 - 5, 17])
                cube([2*main_box_x, 10, 3]);
            
            translate([-main_box_x + ball_bearing_height / 2, -35, 16])
              cylinder  (h = 10, d = 3, center = true);
            
            translate([main_box_x - ball_bearing_height / 2, -35, 16])
              cylinder  (h = 10, d = 3, center = true);  
          }
     }

}

full_apparatus();