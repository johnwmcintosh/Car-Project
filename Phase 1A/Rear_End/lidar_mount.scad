include <../robot_settings.scad>
use <lidar_circuitboard_mount.scad>
use <../arc.scad>

$fn=50;

module lidar_mount() {
      difference() {
        translate([0, rail_length / 2 + 75/2 + 17, 0])
          cube([lidar_mount_x, lidar_mount_y,rail_thickness], center = true);
        
        // attachment cutouts for extension
        translate([-20,  rail_length / 2 + 5, 0])
        cylinder(h = 2 * rail_thickness, d = 3, center = true);
        
        translate([0,  rail_length / 2 + 5, 0])
        cylinder(h = 2 * rail_thickness, d = 3, center = true);
        
        translate([20,  rail_length / 2 + 5, 0])
        cylinder(h = 2 * rail_thickness, d = 3, center = true);
        
        translate([0, rail_length /2 + 75,-rail_thickness / 2 - .1])
        linear_extrude(rail_thickness + .2)
        arc(50,55, 0,180); 
        
        translate([0,rail_length / 2 + 30,0])
        lidar_cutouts();
        }
        
      // lidar circuitboard mound
      translate([-lidar_circuitboard_y / 2 -7.5, lidar_mount_y + lidar_circuitboard_y + 34, 5])
      rotate([0,0,90])
      lidar_circuitboard_mount();
        
        difference() {
          translate([0,  rail_length / 2, rail_thickness])
          cube([lidar_mount_x,  24, rail_thickness], center = true);
          
          // attachment cutouts for extension
          translate([-20,  rail_length / 2 + 5, rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
          translate([0,  rail_length / 2 + 5, rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
          translate([20,  rail_length / 2 + 5, rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
           translate([-20,  rail_length / 2 - 5, rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
          translate([0,  rail_length / 2 - 5, rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
          translate([20,  rail_length / 2 - 5, rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
      }
      
      difference() {
          translate([0,  rail_length / 2, -rail_thickness])
          cube([lidar_mount_x,  24, rail_thickness], center = true);

         // attachment cutouts for extension
          translate([-20,  rail_length / 2 + 5, -rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
         
          translate([0,  rail_length / 2 + 5, -rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
          translate([20,  rail_length / 2 + 5, -rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
           translate([-20,  rail_length / 2 - 5, -rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
          translate([0,  rail_length / 2 - 5, -rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
          
          translate([20,  rail_length / 2 - 5, -rail_thickness])
          cylinder(h = 2 * rail_thickness, d = 3, center = true);
        }
}
lidar_mount();

module lidar_cutouts() {
  translate([-lidar_narrow_screws / 2, 0, 0])
  cylinder(h = 2 * rail_thickness, d = lidar_screw_d, center = true);
  
  translate([lidar_narrow_screws / 2, 0, 0])
  cylinder(h = 2 * rail_thickness, d = lidar_screw_d, center = true);
  
  translate([0, lidar_front_to_back_screws, 0])
  {
    translate([lidar_wide_screws / 2, 0, 0])
    cylinder(h = 2 * rail_thickness, d = lidar_screw_d, center = true);

    translate([-lidar_wide_screws / 2, 0, 0])
    cylinder(h = 2* rail_thickness, d = lidar_screw_d, center = true);
  }
}
//lidar_cutouts();