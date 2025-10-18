include <../robot_settings.scad>
use <../spring_library.scad>
use <dc_motor.scad>
use <../Front_End/axle_for_custom_hub.scad>
use <../Front_End/tire_rim.scad>

$fn = 50;

module rear_apparatus(
  axle_length = 20,
  axle_rotation = false,
  flip_spring = false,
  post_height = 15,
  include_ball_bearing = false,
  include_axle = false,
  incude_motor = false,
  include_rim = false,

  draw_left_apparatus = false,
  )
  
  {
    flip = flip_spring ?  -1 : 1;
    
       // engine housing
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
       
         translate([-4, 0, -1]) {
             difference() {
                rotate([0, 90, 0])
                cylinder(h = 4, d = dc_motor_cutout_d + 6.5, center = true);               
                rotate([0, 90, 0])
                cylinder(h = 4, d = dc_motor_cutout_d + 1, center = true);
                translate([0,0,dc_motor_cutout_d / 2 - 4])
                cube([4, dc_motor_cutout_d + 8, dc_motor_cutout_d / 2 + 10], center = true);
              }
          }
        }
        


                
      // suspension
      translate([0, 0, flip * ball_bearing_outer_diameter + 2])
      springLeaf(width = ball_bearing_height, len =  30, height = 9, thickness = 3);
     
      spring_z = flip_spring ? ball_bearing_outer_diameter  : ball_bearing_outer_diameter;

      // frame connectorß
       translate(
         [
          0, 
          0, 
          2 * ball_bearing_outer_diameter - 2.5
         ])
          cube([ball_bearing_height - .5, 24.5, ball_bearing_outer_diameter], center = true);
      
      difference() {
        // attachment bar
        translate(
            [
                -2 * ball_bearing_height,
                -ball_bearing_height, 
                 2 * ball_bearing_outer_diameter - rail_thickness + 0.5
           ])
          cube([4 * ball_bearing_height, 15, 4]);
        
          // screw hole
          translate(
            [
              -ball_bearing_height - 1, 
              0, 
              2 * ball_bearing_outer_diameter -  ball_bearing_height / 2
            ])
            cylinder(h = 2 * ball_bearing_height, d = dc_motor_screw_d, center = true);
          
          // screw hole
          translate(
            [
              ball_bearing_height + 1, 
              0, 
              2 * ball_bearing_outer_diameter -  ball_bearing_height / 2
            ])
            cylinder(h = 2 * ball_bearing_height, d = dc_motor_screw_d, center = true);
      }
      
      // attachment bar supports
        translate(
          [
            -ball_bearing_height /2 -10.5, 
            6, 
            2 * ball_bearing_outer_diameter - 11
          ])
          cube([12,2,5]);
   
        translate(
              [
                -ball_bearing_height /2 -10.5, 
                6, 
                2 * ball_bearing_outer_diameter - 8.8
              ])
          rotate([0, 25, 0])
          cube([12,2,4]);

       translate(
          [
            -ball_bearing_height /2 -10.5, 
            -7, 
            2 * ball_bearing_outer_diameter - 11
          ])
          cube([12,2,5]);

          translate(
              [
                -ball_bearing_height /2 -10.5, 
                -7, 
                2 * ball_bearing_outer_diameter - 8.8
              ])
          rotate([0, 25, 0])
          cube([12,2,4]);
 
         translate(
          [
            ball_bearing_height /2 - 1.5, 
            6, 
            2 * ball_bearing_outer_diameter - 8
          ])
          cube([12,2,2]);
   
         translate(
          [
            ball_bearing_height /2 - 1.5, 
            -7, 
            2 * ball_bearing_outer_diameter - 8
          ])
          cube([12,2,2]); 
          
 
      if (incude_motor)
        translate([-dc_motor_housing_minus_encoder_z - dc_motor_axle_cutout_z + 7, 0, 0])
        dc_motor();

       if (include_axle)
        translate([16, 0, 0])
        axle(axle_length = 30);
       
       if (include_rim)
         translate([25,0,0])
         rotate([0, -90, 0])
         tirerim();

 }
 rear_apparatus();