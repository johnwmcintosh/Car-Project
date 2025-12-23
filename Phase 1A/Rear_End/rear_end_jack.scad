   include <../robot_settings.scad>
   
    // rear end holder 
    difference() {  
      translate([0, 0, 0])
      rotate([0, 90, 0])
      cylinder(h = 136, d = dc_motor_cutout_d, center = true);
    
        translate([1,0,  3])
        rotate([0, 90, 0])
        cylinder(h = 145, d = dc_motor_cutout_d + 1, center = true);
  }
  
  
  translate([0, 0, -34])
  cube([8,8, 48], center = true);
  
   // rear end cross bar
  difference() {
    translate([23, 0, -34])
    rotate([0, 45, 0])
    cube([8,8,71], center = true);
    
    translate([48, 0, -6])
    cube([15, 15, 8], center = true);  
 }
 
  // rear end cross bar
  difference() {
    translate([-23, 0, -34])
    rotate([0, -45, 0])
    cube([8,8,71], center = true);
   
    translate([-48, 0, -6])
    cube([15, 15, 8], center = true);   
  }
  
  difference() {
  translate([0,  -25, -35])
  rotate([-45, 0, 0])
  cube([8, 8, 71], center = true);
  
  translate([0, 0, -6])
  cube([15, 15, 8], center = true);
  }

  // platform
  translate([0,  0, -60])
    cube([110, 110, 8], center = true);