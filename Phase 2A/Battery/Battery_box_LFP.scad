include <../robot_settings.scad>
include <../Front_End/tobsun_parts.scad>


use <lfp_battery_box_peg_mounts.scad>
use <../rear_end/pico2.scad>
use <../rear_end/RP5.scad>
use <../i2c.scad>
use <../Front_End/targus4mountLFP.scad>
use <tobsun.scad>

module battery_box(show_i2c = false, show_tobsun = false) {

    translate([0,1.5, -4.7]) {
        // tobsun tray
        translate([ -tobsun_shelf_width / 2, lfp_main_box_y / 2 - tobsun_shelf_length + 1, lfp_main_box_z + rail_gap + wall_thickness + 25])
        color("red")
        tobsun_tray(.5, 2.6);
    }
    
    // tray mount
    translate([0, 2.5, 0])
    difference() {
        translate([-10, lfp_main_box_y / 2 - tobsun_shelf_length, lfp_main_box_z + rail_gap + wall_thickness + 2.5]) 
        cube([20, tobsun_shelf_length, 10]);
 
        translate([-5, lfp_main_box_y / 2 - tobsun_shelf_length + 2.5, lfp_main_box_z + rail_gap + wall_thickness + 2.7]) 
        cube([10, tobsun_shelf_length - 5, 10]);
    }
    
    if (show_tobsun) {
        translate([ 0, lfp_main_box_y / 2 - tobsun_shelf_length + 24, lfp_main_box_z + rail_gap + 2.6 * wall_thickness + 24])
        tobsun();
    }
    
    translate([0, 0, battery_box_peg_h]) {
      // rp5 mounting pegs - top right
      translate([-lfp_main_box_x / 2 - wall_thickness / 2, 0 , 0])
      RP5();
     
      // pico extender
      // orientate it so that gpios are easy to access the wires
      translate([lfp_main_box_x / 2 + wall_thickness / 2 + 2, 0, lfp_main_box_z / 2])
      rotate([90, 0, 0])
      pico_mounts();
      
      difference() {
           // container
           translate([0, 0, (lfp_main_box_z + wall_thickness)/2])  
           cube([lfp_main_box_x + wall_thickness, lfp_main_box_y + wall_thickness, lfp_main_box_z + wall_thickness], center = true);
          
          // left cutout for battery terminals
          leftterm = -lfp_battery_width / 2 + lfp_battery_terminal_width_setback - 2.5;
          translate([leftterm, lfp_battery_depth / 2
          -  lfp_battery_terminal_width_setback - 10, lfp_main_box_z +  wall_thickness - 5])
          cube([lfp_battery_terminal_width + 5, lfp_battery_terminal_depth + 10 , 10]);
            
          // right cutout for battery terminals
          righttterm = lfp_battery_width / 2 - lfp_battery_terminal_width - lfp_battery_terminal_width_setback - 2.5;
          translate([righttterm, lfp_battery_depth / 2
          -  lfp_battery_terminal_width_setback - 10, lfp_main_box_z +  wall_thickness - 5])
          cube([lfp_battery_terminal_width + 5, lfp_battery_terminal_depth + 10, 10]);   
          
          // actual battery size
           translate([0, wall_thickness, (lfp_main_box_z + wall_thickness)/2]) 
           cube([lfp_main_box_x, lfp_main_box_y, lfp_main_box_z], center = true);

          // side windows
          translate([ lfp_main_box_x / 2 -wall_thickness,  -35 - lfp_main_box_y /4,   lfp_main_box_z / 2 -   lfp_main_box_z / 8])
              cube([2 * wall_thickness, lfp_main_box_y / 2 + 20,  lfp_main_box_z / 4]);
              
          // side windows
          translate([-lfp_main_box_x / 2 - wall_thickness,  -35 - lfp_main_box_y /4, lfp_main_box_z / 2 -   lfp_main_box_z / 8])
              cube([2 * wall_thickness, lfp_main_box_y / 2 + 20,  lfp_main_box_z / 4]);  
        }    
    }
           
          
                       
      translate([0, 0, -.2])
      battery_box_peg_mounts();
      
      translate([-lfp_main_box_x / 2 + 1, lfp_main_box_y / 2 - tobsun_shelf_width - 33 , wall_thickness])
      // usb hub mount
      targus4mount(); 

      if (show_i2c) {
          translate([-i2c_w +  i2c_w /2 - 2,  -lfp_main_box_y / 2 + i2c_pin_l, lfp_main_box_z + wall_thickness + i2c_l])
            rotate([120, 0, 180])
              i2c();  
         
          translate([i2c_w - i2c_w / 2 + 3, -lfp_main_box_y / 2 + i2c_pin_l, lfp_main_box_z + wall_thickness + i2c_l])
            rotate([120, 0, 180])
              i2c();
     }
       
    // i2c holder
     translate([-lfp_main_box_x/2 + 1, -lfp_main_box_y / 2 - 4.3, wall_thickness - 2])
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

  
     // i2c holder
    translate([-lfp_main_box_x / 2 + i2c_w - 2, -lfp_main_box_y / 2 - 4.3, wall_thickness - 2])
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
      
   // i2c holder
      translate([lfp_main_box_x/2 - 6, -lfp_main_box_y / 2 - 4.3, wall_thickness - 2])
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
      
   // i2c holder
      translate([lfp_main_box_x / 2 - i2c_w - 3, -lfp_main_box_y / 2 - 4.3, wall_thickness - 2])
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