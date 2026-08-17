include <../robot_settings.scad>

use <../Front_End/robot_rail.scad>
use <../Front_End/tire_apparatus.scad>

use <../Front_End/Battery_box_3.scad>
use <../Front_End/battery_box_peg_mounts.scad>
use <../Front_End/OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <../Front_End/battery_box_peg_mounts.scad>
use <../spring_library.scad>

use <dc_motor.scad>
use <lidar_mount.scad>
use <rear_apparatus2.scad>
use <../power_bar_mount.scad>
use <drv8871.scad>
use <drv8871mount.scad>
use <battery_box_support.scad>
use <../Front_End/steering_motor_holder.scad>
use <dc_motor.scad>
$fn = 50;


module rear_robot_rail(
    include_apparatus = true, 
    include_battery_box = true,
    include_power_bar = false,
    show_lidar_platform = false
    )
    
    {
    difference() {
      front_robot_rail(show_steering_apparatus = include_apparatus);
      
      // tire apparatus cutouts
      translate([-rail_width / 2 + 21.5, -rail_length / 2 + 35, -rail_thickness / 2])
       cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true);
      
      translate([rail_width / 2 - 21.5, -rail_length / 2 + 35, -rail_thickness / 2])
      cube([ball_bearing_height - .3, 25.2, ball_bearing_outer_diameter], center = true); 
 
      // Pi's power passthrough
      translate([-rail_width / 3 + 27, power_bar_y / 2 - 51, rail_thickness / 2])
      {
      cube([power_bar_y /2.3, 60, 2 * rail_thickness], center = true); 
        union()
        translate([-10, -30, -5])
      cube([power_bar_y / 2.3, 40, 2 * rail_thickness]);
      }
            
      // power bar wire passthrough cutouts
      translate([-rail_width / 3 + 10,  power_bar_y / 2 + 32, rail_thickness / 2])
      cube([power_bar_y / 2.3, power_bar_cutout_x, 2 * rail_thickness], center = true);
      
      // power bar wire passthrough cutouts
      translate([rail_width / 3 - 10,  power_bar_y / 2 + 26, rail_thickness / 2])
      cube([power_bar_y / 2.3, power_bar_cutout_x - 10 , 2 * rail_thickness], center = true);
      
      // Pico's  passthrough
      translate([rail_width / 3 - 10, power_bar_y / 2 - 52, rail_thickness / 2])
      cube([power_bar_y /2.3, 60, 2 * rail_thickness], center = true); 
      
      // right switch cutout
      translate([rail_width /2 - 20, -45, - rail_thickness / 2 + 2])
      cylinder(rail_thickness + 4, d = switch_cutout_d);
                  
      // right switch bump cutout
      color("green")
      translate([rail_width /2 - 28, -54, rail_thickness  - switch_bump_h + 1])
      cube([switch_w, switch_bump_l,  switch_bump_h]);
      
      // left switch cutout
      translate([-rail_width /2 + 20, -45, - rail_thickness / 2 + 2])
      cylinder(rail_thickness + 4, d = switch_cutout_d);

      // left switch bump cutout
      color("green")
      translate([-rail_width /2 + 12, -54, rail_thickness - switch_bump_h + 1])
      cube([switch_w, switch_bump_l,  switch_bump_h]);    
      }

    // rear apparatus
    if (include_apparatus) {
        translate([rail_width / 2 - 22.5, -rail_length / 2 + 35, -40])
          rear_apparatus2(flip_apparatus=true, include_motor = true, include_coupler = true, motor_z_offset=0);
          dc_motor();
        translate([-rail_width / 2 + 21.5, -rail_length / 2 +- 35, -40])
          rear_apparatus2(flip_apparatus = false, include_motor = true, include_coupler = true, motor_z_offset = 0);
      }

translate([0, 0, -0]) {

      // U structures holding the engine supports - seperate the verical bars by at least an engine width so manuerving the motors into the cradle is possible.
      wall_thickness = 5;
      post_thickness_x_y = 10;
      post_wallside_position_y = 12.5;
      post_separation_y = 47.5;
      post_x_position = 60.5; //note the four end positions are not "mirrored" because the zero point for each bar is on the left edge. 
      
      // posts
      translate([0, -rail_length / 2, -57.5]) {
          // center
          translate([-5, post_wallside_position_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64]);
          //translate([-5, post_separation_y, 0])
          //cube([post_thickness_x_y, post_thickness_x_y, 64]); // removed this post to make it easier to install the motors
          translate([-5, 17.5, 0])
          cube([post_thickness_x_y, 40, post_thickness_x_y]);
          
          // left
          translate([-post_x_position - 10, post_wallside_position_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]);
          translate([-post_x_position - 10, post_separation_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]);      
                  
          // right
          translate([post_x_position, post_wallside_position_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]);
          translate([post_x_position, post_separation_y, 0])
          cube([post_thickness_x_y, post_thickness_x_y, 64.5]); 
      }
      
      // walls and floor
      translate([0, -rail_length / 2 + 35, -55.5]) {

        // front cradle wall
        translate([0, -15, 10])
        cube([2 * post_x_position, wall_thickness, 22], center = true);
      
        // cradle floor
        translate([0, 0, .5])
        cube([2 * (post_x_position + post_thickness_x_y), 35, wall_thickness], center = true);


         translate([ -post_x_position - post_thickness_x_y, 0, 14.5]) {
             // end wall plus cutouts
            difference() {
              
                  // side wall
                  color("orange")
                  translate([0, -post_separation_y / 2 + 2.5, -14.5])
                    cube([wall_thickness, post_separation_y - 5, 22]);
                
                  // cutout for axle ring
                  translate([-dc_motor_axle_ring_z / 2, 0, 1])
                     rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
                    
                    // cutouts for screws
                    translate([-dc_motor_axle_ring_z / 2, -dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
                            
                    translate([-dc_motor_axle_ring_z / 2, dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);  
                } // difference
                
                difference() {
                  // inner setback wall (for countersinking)
                  translate([dc_motor_screw_head_z, -post_separation_y / 2 + 2.5, -14.5])
                      cube([wall_thickness - dc_motor_screw_head_z, post_separation_y - 5, 22]);
                      
                  // cutout for axle ring
                  translate([-dc_motor_axle_ring_z / 2, 0, 1])
                     rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
                        
                    // cutouts for screws
                    translate([-dc_motor_axle_ring_z / 2, -dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);
                            
                    translate([-dc_motor_axle_ring_z / 2, dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);  
                }
                
        }  // translate

        translate([post_x_position + post_thickness_x_y - wall_thickness, 0, 14.5]) {
            // end wall plus cutouts
            difference() {
            
                // side wall
                color("green")
                translate([0, -post_separation_y / 2 + 2.5, -14.5])
                cube([wall_thickness, post_separation_y - 5, 22]);
                
                 // cutout for axle ring
                 translate([-dc_motor_screw_head_d / 2 + 1, 0, 1])
                 rotate([0, 90, 0])
                    cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);

                // cutouts for screws
                translate([-dc_motor_screw_head_d / 2 + 1, -dc_motor_screw_offset, 1])
                rotate([0, 90, 0])
                    cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
                        
                translate([-dc_motor_screw_head_d / 2 + 1, dc_motor_screw_offset, 1])
                rotate([0, 90, 0])
                    cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_screw_head_d + .2);
               }
               
                               
                difference() {
                 // inner setback wall (for countersinking)

                  translate([0, -post_separation_y / 2 + 2.5, -14.5])
                      cube([wall_thickness - dc_motor_screw_head_z, post_separation_y - 5, 22]);
                      
                  // cutout for axle ring
                  translate([-dc_motor_axle_ring_z / 2, 0, 1])
                     rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = dc_motor_axle_notch_cutout_z + 2);
                        
                    // cutouts for screws
                    translate([-dc_motor_axle_ring_z / 2, -dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);
                            
                    translate([-dc_motor_axle_ring_z / 2, dc_motor_screw_offset, 1])
                    rotate([0, 90, 0])
                        cylinder(h = dc_motor_axle_ring_z + 5, d = M3_shaft_d + .2);  
                }
          }
    }
}

      // battery box attachment points
      translate([-2.5, -rail_length / 2 + 84, battery_box_peg_h])
      battery_box_peg_mounts(show_mounts = false, show_points = true);
    
      if (include_battery_box) {
          translate([-2.5, -main_box_y + 61, 2.4 + 8])
          battery_box();
      }
      
     // REAR SUPPORT for battery box
     translate([-.6, -main_box_y - .3, 0])
      battery_box_support();
      
     // FRONT SUPPORT for battery box
     translate([-4.6, 20, 2])
      rotate([0, 0, 180])
      battery_box_support();
      
    // drv8871 Adafruit platform STEERING
    translate([-drv8871_screw_distance + drv8871_x + 20, -rail_length / 2 + 3 * drv8871_y, -rail_thickness / 2 + 3])
      rotate([180, 0, 180])
      drv8871mount();
    
    // drv8871 Teyleten platform STEERING
    translate([-drv8871_screw_distance + drv8871_x/2 -20,  -rail_length / 2 + 3 * drv8871_y, -rail_thickness / 2 + 3])
      rotate([180, 0, 180])
      drv8871mount("Teyleten");
    
    // drv8871 Adafruit platform LOWER LEFT
    translate([- drv8871_screw_distance -20, -rail_length / 2 + 6 * drv8871_y, -rail_thickness / 2 + 3])
    rotate([180,0,-90])
    drv8871mount();
 
    // drv8871 Teyleten platform LOWER LEFT
    translate([- drv8871_screw_distance - 20, -rail_length / 2 + 5 * drv8871_y, -rail_thickness / 2 + 3])
    rotate([180,0,-90])
    drv8871mount("Teyleten");    
    
    // drv8871 Adafruit platform LOWER RIGHT
    translate([drv8871_screw_distance + 25, -rail_length / 2 + 6 * drv8871_y, -rail_thickness / 2  + 3])
    rotate([180,0,90])
    drv8871mount();
      
   // drv8871 Teyleten platform LOWER RIGHT
  translate([drv8871_screw_distance + 25, -rail_length / 2 + 5 * drv8871_y, -rail_thickness / 2  + 3])
    rotate([180,0,90])
    drv8871mount("Teyleten"); 
    
    if (show_lidar_platform) {
      lidar_mount();
    }
  
    // Steering motor holder
    translate([0, -45.5, -17])
    rotate([180, 0, 90])
    steering_motor_holder();
   
    // power bar stand LEFT
    translate([-rail_width / 3 - 10, 80,  rail_thickness / 2 + 3 ])
    power_bar_mounts();

    translate([-rail_width / 3 - 10, 80,  -rail_thickness / 2 + 4 ]) 
    rotate([0, 180, 0])
    power_bar_mounts();
    
    // power bar stand RIGHT
    translate([rail_width / 3 + 10, 80,  rail_thickness / 2 + 3 ])
    power_bar_mounts();

    translate([rail_width / 2 - 32, 80, -rail_thickness / 2 + 4])
    rotate([0, 180, 0])
    power_bar_mounts();
    
    // power bar label LEFT
    //' top
    color("blue")
    translate([-rail_width / 3 - power_bar_y / 2, power_bar_y / 2 - 36,  rail_thickness / 2 + 2.9])
    linear_extrude(1)
      text("3.3V", 6);
   
   // bottom
    color("blue")
    translate([-rail_width / 3 + power_bar_y / 2.5, power_bar_y / 2 - 36,  -rail_thickness / 2 + 4])
    rotate([0, 180, 0])
    linear_extrude(1)
      text("3.3V", 6);     
    
    // top
    color("green")
    translate([-rail_width / 3 - power_bar_y / 2 - 13, power_bar_y / 2 - 36,  rail_thickness / 2 + 3])
      linear_extrude(1)
      text("N", 6);

     // bottom
    color("green")
    translate([-rail_width / 3 - power_bar_y / 2 - 10, power_bar_y / 2 - 36,  -rail_thickness / 2 + 4])
      rotate([0, 180, 0])
      linear_extrude(1)
      text("N", 6);
      
      color("black")
      translate([rail_width / 2 - 4, -55, 1])
      rotate([90, 0, 90])
      linear_extrude(2)
      text("ON -->", 5);
    
    // power bar label RIGHT
    
    // top
    color("red")
    translate([rail_width / 3 - power_bar_y / 2 + 5, power_bar_y / 2 - 36,  rail_thickness / 2 + 3])
      linear_extrude(1)
      text("12V", 6);
    
    // bottom
    color("red")
    translate([rail_width / 3 - power_bar_y / 2 + 20, power_bar_y / 2 - 36,  -rail_thickness / 2 + 4])
    rotate([0, 180, 0])
      linear_extrude(1)
      text("12V", 6);      
    
    // top
    color("green")
    translate([rail_width / 3 + power_bar_y / 2 + 5, power_bar_y / 2 - 36,  rail_thickness / 2 + 3])
      linear_extrude(1)
      text("N", 6);
    
    // bottom
    color("green")
    translate([rail_width / 3 + power_bar_y / 2 + 15, power_bar_y / 2 - 36,  -rail_thickness / 2 + 4])
    rotate([0, 180, 0])
      linear_extrude(1)
      text("N", 6);
    }
    
    translate([20, rail_length / 2 - 30, -rail_thickness + 6])
    color("orange")
    linear_extrude(1)
    rotate([0, 180, 0])
    text("McIntosh" , 6);
      
rear_robot_rail();
