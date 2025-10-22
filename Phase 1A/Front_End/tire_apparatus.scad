include <../robot_settings.scad>

use <axle_for_custom_hub.scad>
use <pull_bar.scad>
use <physical_ball_bearing.scad>
use <../spring_library.scad>
$fn = 50;

module tire_apparatus(
  axle_length = 20,
  axle_rotation = false,
  armature_holder_height = 20,
  armature_holder_thickness = 8,
  armature_holder_width = 28,
  pull_bar_length = 25,
  flip_spring = false,
  post_height = 15,
  include_ball_bearing = false,
  include_axle = true,
  rear_axle = false,
  include_pull_bar = true,
  include_grab_bar = false,
  draw_left_apparatus = false
) 
{  
  if (include_axle)
    axle(axle_length = axle_length + 10, rotate = axle_rotation, rear_axle = rear_axle);

  if (include_ball_bearing) {
  // ball bearing
  translate([axle_length - ball_bearing_height / 2, 0, 0])
  rotate([0, 90, 0])
  physical_ball_bearing();
  }

  translate([0, -8, 0])
  {
  // armature location
   armature_edge = armature_holder_width +  19.1 / 2;
   flip = 1;
    
  difference() { 
     // armature
      translate([0,  - armature_edge,  -armature_holder_height / 2])
      cube([armature_holder_thickness, armature_holder_width, armature_holder_height]);
    
     translate([0, -3, 0]) {
      // armature pull bar cutout
      translate([-1,  -armature_edge + armature_holder_width / 2,  0])
      rotate([0, 90, 0])
      cylinder(h = 20, r = 5.5);
     }
   
     // armature grab bar cutout
      translate([armature_holder_thickness / 2,  -armature_edge + armature_holder_width / 2 - 5.5 / 2,  -armature_holder_height / 2 + 1])
      cylinder(h = armature_holder_height + 1, r =   3.1);
     
     // draw slanted turning spaces
      if (draw_left_apparatus) 
        {
        translate([armature_holder_thickness / 2 + 2, -armature_edge + armature_holder_width / 2 - 7, 0])
        rotate([0,90,-40])
        cylinder(h = armature_holder_thickness, r = 2);
                
        translate([armature_holder_thickness / 2 + 8, -armature_edge + armature_holder_width / 2 + 6 , 0])
        rotate([0,90,-140])
        cylinder(h = armature_holder_thickness, r = 2);
      }
      else 
      {
        translate([-armature_holder_thickness / 2 + 1, -armature_edge + armature_holder_width / 2 - 11, 0])
        rotate([0,90,40])
       cylinder(h = armature_holder_thickness, r = 2);
    
        translate([-armature_holder_thickness / 2 + 7, -armature_edge + armature_holder_width / 2  , 0])
        rotate([0,90,140])
        cylinder(h = armature_holder_thickness, r = 2); 
      }
    }

    
    // armature grab bar
    if (include_grab_bar)
   translate([armature_holder_thickness / 2,  -60, -6.5])
   cylinder(h = armature_holder_height + 5, r = 3);

   if (include_pull_bar)
    // armature pull bar
    translate([armature_holder_thickness / 2, -26.5, 0]) 
    pull_bar(pull_bar_length, rotate = axle_rotation);
  }
 
    translate([0, 0, 0])
    {
        // ball bearing housing
      difference() {
          translate([0, 0, 0])
          rotate([0, 90, 0])
          cylinder(h =  ball_bearing_height, d = 2 * ball_bearing_outer_diameter);

           translate([-1, 0, 0])
          rotate([0, 90, 0])
          cylinder(h = 2 * ball_bearing_height, d = ball_bearing_outer_diameter + .1);   
        }
      
      // suspension
      flip = flip_spring ?  -1 : 1;
      translate([ball_bearing_height / 2, 0, flip * ball_bearing_outer_diameter + 2])
      springLeaf(width = ball_bearing_height, len =  30, height = 9, thickness = 3);

      // post
      spring_z = flip_spring ? ball_bearing_outer_diameter  : ball_bearing_outer_diameter;
      translate([ball_bearing_height / 2 , 0, flip * spring_z + 7])
       rotate([flip_spring ? 180 : 0, 0, 0])
      cylinder(h = post_height + ball_bearing_height, d = ball_bearing_inner_diameter - .09);
    }
}
tire_apparatus();
