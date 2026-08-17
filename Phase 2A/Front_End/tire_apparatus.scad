include <../robot_settings.scad>

use <steering_coupler.scad>
use <axle_for_custom_hub.scad>
use <tire_rim.scad>

use <physical_ball_bearing.scad>
use <../Rear_End/dc_motor.scad>

$fn = 50;

module tire_apparatus(
    axle_length = 41.5,
    armature_holder_width = 28,
    pull_bar_length = 25,
    rotate = false,
    motor_z_offset = 0,

    include_ball_bearing = false,
    include_armature = false,
    include_steering_coupler = true,
    include_apparatus = true,
    include_motor = true,
    include_axle = true,
    include_rim = false
) 
{  
  deg_rotate = rotate ? 180 : 0;
  
  rotate([0, deg_rotate, 0]) {
      translate([-ball_bearing_height, 0, 0])
      {
      
          if (include_axle) {
            difference() {
                color("blue")
                translate([axle_length + 10.9, 0, 0])
                  axle(axle_length = axle_length, rotate = true, rear_axle = false);
                  
                 // holes to allow reach to the motor screws
                translate([-20, 8.5, 0])
                  rotate([0, 90, 0])
                      cylinder(h = 900, d = M3_shaft_d);
                  
                translate([-20, -8.5, 0])
                  rotate([0, 90, 0])
                      cylinder(h = 900, d = M3_shaft_d);
               }
           }

          if (include_steering_coupler) {
              translate([-12.8, 0, 0])
              rotate([0, 90, 0])
                steering_coupler();
           }
            
          if (include_motor) {
                translate([-79.5, 0, motor_z_offset])
                //color(rotate?"green": "red")
                dc_motor();
            }
 
        if (include_ball_bearing) {          
          // ball bearing for tire
          
          translate([ball_bearing_height + 3.6, 0, 0])
          rotate([0, 90, 0])
          physical_ball_bearing();

        }

    if (include_apparatus) {
          if (include_armature) {
              translate([0, -8, 0])
              {
                // armature location
                 armature_edge = armature_holder_width +  19.1 / 2;
                 
                 // armature
                  translate([0,  - armature_edge,  -armature_holder_height / 2])
                  cube([2 * ball_bearing_height , armature_holder_width, armature_holder_height]);
              }
          }
            // ball bearing housing wheel
          
           difference() {
              translate([0, 0, 0])
              rotate([0, 90, 0])
              cylinder(h = 2 * ball_bearing_height, d = 2 * ball_bearing_outer_diameter);
             
              translate([-1.5, 0, 0])
              rotate([0, 90, 0])
              cylinder(h = 3 * ball_bearing_height, d = ball_bearing_outer_diameter + .19);  

             translate([-.1, 0, 0])
              rotate([0, 90, 0])
              cylinder(h = 3.1, d = ball_bearing_outer_diameter + 2);
            }
              
            // add a little ring inside for the ball bearing and axle cap so it snuggly fits on wheel side
            translate([3, 0, 0])
            rotate([0, 90, 0])
            {
              difference() {
                cylinder(h = ball_bearing_height - 3, d = ball_bearing_outer_diameter + .2);
                translate([0, 0 , -1])
                cylinder(h = ball_bearing_height + 2, d = 2 * ball_bearing_inner_diameter);
              }
           }
         }
       }
   }
        if (include_rim)
        {
        translate([23.5, 0, 0])
        rotate([0, 90, 180])
            tirerim();
        }
              
 }
tire_apparatus();
