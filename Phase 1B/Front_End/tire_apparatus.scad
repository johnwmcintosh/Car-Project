include <../robot_settings.scad>

use <../apparatus_pegs.scad>
use <axle_for_custom_hub.scad>
use <pull_bar.scad>
use <physical_ball_bearing.scad>
use <../spring_library.scad>
$fn = 50;

module tire_apparatus(
  axle_length = 18,
  axle_rotation = true, // true is left side
  armature_holder_width = 28,
  pull_bar_length = 25,

  include_ball_bearing = true,
  include_steering = true,
  include_axle = true
) 
{  
  

  if (include_axle) {
    // axle_rotation is half handled here and half inside axle()
    offset = axle_rotation ? axle_length - 2 * ball_bearing_height : -10;

    translate([offset + 10, 0, 0])
      axle(axle_length = axle_length + 8, rotate = axle_rotation, rear_axle = false);
  }

  if (include_ball_bearing) {
    
    // ball bearing for tire
    
    translate([ball_bearing_height / 2, 0, 0])
    rotate([0, 90, 0])
    physical_ball_bearing();

  }

  translate([0, -8, 0])
  {
    // armature location
     armature_edge = armature_holder_width +  19.1 / 2;
     flip = 1;
      
     // armature
      translate([0,  - armature_edge,  -armature_holder_height / 2])
      cube([armature_holder_thickness - 1, armature_holder_width, armature_holder_height]);

  }
 
    // ball bearing housing wheel
  
   difference() {
      translate([0, 0, 0])
      rotate([0, 90, 0])
      cylinder(h = 2 * ball_bearing_height, d = 2 * ball_bearing_outer_diameter);

      translate([-1, 0, 0])
      rotate([0, 90, 0])
      cylinder(h = 3 * ball_bearing_height, d = ball_bearing_outer_diameter + .19);   
    }
    
    rotate([0, 90, 0])
    translate([ball_bearing_height -7, 0, 11])
    {
      difference() {
    cylinder(ball_bearing_height - 1, d = ball_bearing_outer_diameter + .2, center = true);
    cylinder(ball_bearing_height + 2, d = 2 * ball_bearing_inner_diameter, center = true);
      }
    }
    
 }
tire_apparatus();
