include <../robot_settings.scad>
include <tobsun_parts.scad>

use <battery_box_3.scad>
use <lfp_battery_box_peg_mounts.scad>
use <../rear_end/pico2.scad>
use <../rear_end/RP5.scad>
use <../i2c.scad>
use <targus4mountLFP.scad>

module battery_box(show_i2c = false) {

    // tobsun
    translate([ - tobsun_shelf_width / 2, lfp_main_box_y / 2 - tobsun_shelf_length + 1, lfp_main_box_z + rail_gap + 2.6 * wall_thickness])
    tobsun_tray();

    translate([0, 0, 6]) {
      // rp5 mounting pegs - top right
      translate([-lfp_main_box_x / 2 - .9, 0 , 0])
      RP5();
     
      // pico extender
      // orientate it so that gpios are easy to access the wires
      translate([lfp_main_box_x / 2 + 3, 0, lfp_main_box_z / 2])
      rotate([90, 0, 0])
      pico_mounts();

        difference() {
           translate([0, 0, (lfp_main_box_z + wall_thickness)/2]) 
              // container
              cube([lfp_main_box_x + wall_thickness, lfp_main_box_y + wall_thickness, lfp_main_box_z + wall_thickness], center = true);
             
              // actual battery size
              translate([0, wall_thickness, (lfp_main_box_z + wall_thickness)/2]) 
                cube([lfp_main_box_x, lfp_main_box_y, lfp_main_box_z], center = true);
               
               
            // side windows
            translate([ lfp_main_box_x / 2 -wall_thickness,  0 - lfp_main_box_y /4, lfp_main_box_z / 2 -   lfp_main_box_z / 8])
              cube([2 * wall_thickness, lfp_main_box_y / 2,  lfp_main_box_z / 4]);
              
            // side windows
            translate([-lfp_main_box_x / 2 - wall_thickness,  0 - lfp_main_box_y /4, lfp_main_box_z / 2 -   lfp_main_box_z / 8])
            cube([2 * wall_thickness, lfp_main_box_y / 2,  lfp_main_box_z / 4]);  
        }       
      }
      
      translate([0, 0, -.2])
      battery_box_peg_mounts();
      
      translate([-lfp_main_box_x / 2 + 1, lfp_main_box_y / 2 - tobsun_shelf_width - 33 , 3])
      // usb hub mount
      targus4mount(); 

      if (show_i2c) {
          translate([-i2c_w +  i2c_w /2 - 2,  -lfp_main_box_y / 2 + i2c_pin_l, lfp_main_box_z + i2c_l])
            rotate([120, 0, 180])
              i2c();  
         
          translate([i2c_w - i2c_w / 2 + 3, -lfp_main_box_y / 2 + i2c_pin_l, lfp_main_box_z + i2c_l])
            rotate([120, 0, 180])
              i2c();
     }
          
     translate([-lfp_main_box_x/2 + 1, -lfp_main_box_y / 2 - 4.3, 0])
     difference() {
        // mount pre-cutout
         translate([-1,  0, lfp_main_box_z + 7.5])
         cube([7, 30, 35]);
      
       // mount cutout angle
       translate([-5 , 25, lfp_main_box_z + 45])
           rotate([150, 0, 0]) 
                cube([15, 30, 55]);
       
       // upper left screw hole
       translate([2.9, 18.5, lfp_main_box_z + 40.8])
          rotate([-125, 0, 0])
            cylinder(h = 13, d = i2c_screw_hole_d);    
       
       // lower left screw hole
       translate([2.9, 4, lfp_main_box_z + 20.4])
          rotate([-125, 0, 0])
            cylinder(h = 20, d = i2c_screw_hole_d);      
     }

  
     translate([-lfp_main_box_x / 2 + i2c_w - 2, -lfp_main_box_y / 2 - 4.3, 0])
     difference() {
        // mount pre-cutout
         translate([-1,  0, lfp_main_box_z + 7.5])
         cube([7, 30, 35]);
      
       // mount cutout angle
       translate([-5 ,  25, lfp_main_box_z + 45])
           rotate([150, 0, 0]) 
                cube([15, 30, 55]);
       
       // upper left screw hole
       translate([2.9, 18.5, lfp_main_box_z + 40.8])
          rotate([-125, 0, 0])
            cylinder(h = 13, d = i2c_screw_hole_d);    
       
       // lower left screw hole
       translate([2.9, 4, lfp_main_box_z + 20.4])
          rotate([-125, 0, 0])
            cylinder(h = 20, d = i2c_screw_hole_d);      
     }
      
     translate([lfp_main_box_x/2 - 6, -lfp_main_box_y / 2 - 4.3, 0])
     difference() {
        // mount pre-cutout
         translate([-1,  0, lfp_main_box_z + 7.5])
         cube([7, 30, 35]);
      
       // mount cutout angle
       translate([-5 ,  25, lfp_main_box_z + 45])
           rotate([150, 0, 0]) 
                cube([15, 30, 55]);
       
       // upper left screw hole
       translate([2.9, 18.5, lfp_main_box_z + 40.8])
          rotate([-125, 0, 0])
            cylinder(h = 13, d = i2c_screw_hole_d);    
       
       // lower left screw hole
       translate([2.9, 4, lfp_main_box_z + 20.4])
          rotate([-125, 0, 0])
            cylinder(h = 20, d = i2c_screw_hole_d);     
     }
      
     translate([lfp_main_box_x / 2 - i2c_w - 3, -lfp_main_box_y / 2 - 4.3, 0])
     difference() {
        // mount pre-cutout
         translate([-1,  0, lfp_main_box_z + 7.5])
         cube([7, 30, 35]);
      
       // mount cutout angle
       translate([-5 ,  25, lfp_main_box_z + 45])
           rotate([150, 0, 0]) 
                cube([15, 30, 55]);
       
       // upper left screw hole
       translate([2.9, 18.5, lfp_main_box_z + 40.8])
          rotate([-125, 0, 0])
            cylinder(h = 13, d = i2c_screw_hole_d);    
       
       // lower left screw hole
       translate([2.9, 4, lfp_main_box_z + 20.4])
          rotate([-125, 0, 0])
            cylinder(h = 20, d = i2c_screw_hole_d);    
     }

}

battery_box(false);