include <../robot_settings.scad>
use <../spring_library.scad>
use <dc_motor.scad>
use <../Front_End/axle_for_custom_hub.scad>

$fn = 50;

module rear_apparatus(
  axle_length = 20,
  axle_rotation = false,
  flip_spring = false,
  post_height = 15,
  include_ball_bearing = false,
  include_axle = false,
  incude_motor = false,

  draw_left_apparatus = false,
  )
  
  {
    flip = flip_spring ?  -1 : 1;
    
       // ball bearing housing
      difference() {
          translate([0, 0, 0])
          rotate([0, 90, 0])
          cylinder(h =  ball_bearing_height, d = 2 * ball_bearing_outer_diameter, center = true);

          translate([-1, 0, 0])
            rotate([0, 90, 0])
            cylinder(h = 2 * ball_bearing_height, d = 10, center = true); 
        
          translate([-ball_bearing_height, -dc_motor_screw_offset, 0])
            rotate([0, 90, 0])
            cylinder(h = 2 * ball_bearing_height, d = dc_motor_screw_d);
          
          translate([-ball_bearing_height, dc_motor_screw_offset, 0])
            rotate([0, 90, 0])
            cylinder(h = 2 * ball_bearing_height, d = dc_motor_screw_d);
       }
                
      // suspension
      translate([0, 0, flip * ball_bearing_outer_diameter + 2])
      springLeaf(width = ball_bearing_height, len =  30, height = 9, thickness = 3);
     
      spring_z = flip_spring ? ball_bearing_outer_diameter  : ball_bearing_outer_diameter;

       // post 1
       // carve a screw hole in post 1
       difference() {

         // the post
          translate([0 , 10, flip * spring_z + 7])
          rotate([flip_spring ? 180 : 0, 0, 0])
          cylinder(
              h = post_height + 2 * ball_bearing_height, 
              d = ball_bearing_inner_diameter);

         // the screw hole 
         translate([2, 10, flip * spring_z + 7 + 26])
             rotate([0,90,0])
              cylinder(
                  h = 10, 
                  d = dc_motor_screw_d);  
       }
     
      // post 2
       // carve a screw hold in post 2
       difference() {
      translate([0 , -10, flip * spring_z + 7])
       rotate([flip_spring ? 180 : 0, 0, 0])
      cylinder(
          h = post_height + 2 * ball_bearing_height, 
          d = ball_bearing_inner_diameter);
       
       // the screw hole
       translate([2, -10, flip * spring_z + 7 + 26])
        rotate([0,90,0])
       cylinder(
            h = 10,
           d = dc_motor_screw_d);
       }

      if (incude_motor)
        translate([-dc_motor_housing_minus_encoder_z - dc_motor_axle_cutout_z + 7, 0, 0])
        dc_motor();

       if (include_axle)
        translate([16, 0, 0])
        axle(axle_length = 30);

 }
 rear_apparatus();