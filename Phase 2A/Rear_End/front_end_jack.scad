   include <../robot_settings.scad>
   
   // front end jack
  module front_jack()
  {
    // top bar
//    translate([0, 0, 108]) {
//      difference() {
//        cube([2.05 * lidar_mount_x, 10, dc_motor_cutout_d], center = true);    
//    
//        translate([0, 0,  -rail_thickness + 7])
//        cube([lidar_mount_x + 10, 24, 4 * rail_thickness], center = true);
//       } 
//   }
// 
     // left post
    translate([-51, 0, 54])
    cube([8,8,108], center = true);
    
    // left back support
    translate([-51,  -26, 55])
    rotate([-25, 0, 0])
    color("green")
    cube([8, 8, 120], center = true);
    
    // center post
//    translate([0, 0, 108/2])
//    cube([8,8, 108], center = true);
   
    // center back support 
//    translate([0,  -26, 55])
//    rotate([-25, 0, 0])
//    cube([8, 8, 120], center = true);
    
    // right post
    translate([51, 0, 108/2])
    cube([8,8, 108], center = true);
   
    // right back support 
    translate([51,  -26, 55])
    rotate([-25, 0, 0])
    cube([8, 8, 120], center = true);
    
    // front cross beam
    translate([0, 0, 50])
    cube([95, 8, 10], center = true);
    
    // back cross beam
    translate([0, -28, 50])
    color("green")
    cube([95, 8, 10], center = true);
    
    // cross beam connector
    translate([0, -14, 50])
    cube([10, 37, 10], center = true);
   
   // clam 
   translate([0, 16, 108]) {
   difference() {
        union() {
            // left upper clam
            translate([0,  0, rail_thickness])
            cube([2 * lidar_mount_x,  24, rail_thickness], center = true);
            
            // left lower clam
            translate([0,  0, -rail_thickness])
            cube([2 * lidar_mount_x,  24, rail_thickness], center = true);
        }
        
        // remove the middle clam
        translate([0, 7, 0])
        cube([95, 40, 4 * rail_thickness], center = true);
        }
        
        // left rear support
        translate([-66, -16, 0])
        color("blue")
        cube([38, 10, 20.5], center = true);
        
        // right rear support
        translate([66, -16, 0])
        cube([38, 10, 20.5], center = true);
        
        translate([0, -16, -30])
        cube([100, 8, 8], center = true);
     }

    // side angle support
    translate([61, 0, 74])
    rotate([0, 35, 0])
    color("red")
    cube([8, 8, 65], center = true);

    // side angle support
    translate([-61, 0, 74])
    rotate([0, -35, 0])
    cube([8, 8, 65], center = true);
    
    // platform
    translate([0,  0, 0])
      cube([140, 110, 8], center = true);
}
front_jack();