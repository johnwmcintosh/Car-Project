   include <../robot_settings.scad>
   
   // front end jack
  
  // top bar
  translate([0, 0, 108])
  cube([110, 10, dc_motor_cutout_d], center = true);
  
   // left post
  translate([-40, 0, 54])
  cube([8,8,108], center = true);
  
  // left back support
  translate([-40,  -26, 55])
  rotate([-25, 0, 0])
  cube([8, 8, 120], center = true);
  
  // center post
  translate([0, 0, 108/2])
  cube([8,8, 108], center = true);
 
  // center back support 
  translate([0,  -26, 55])
  rotate([-25, 0, 0])
  cube([8, 8, 120], center = true);
  
  // center post
  translate([40, 0, 108/2])
  cube([8,8, 108], center = true);
 
  // center back support 
  translate([40,  -26, 55])
  rotate([-25, 0, 0])
  cube([8, 8, 120], center = true);
 
 // clam 
 translate([0, 16, 108])
  union() {
  translate([0,  0, rail_thickness])
  cube([lidar_mount_x,  24, rail_thickness], center = true);
  
  translate([0,  0, -rail_thickness])
  cube([lidar_mount_x,  24, rail_thickness], center = true);
  }


  // platform
  translate([0,  0, 0])
    cube([110, 110, 8], center = true);