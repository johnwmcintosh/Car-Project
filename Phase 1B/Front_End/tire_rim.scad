include <../robot_settings.scad>

$fn = 50;

module tirerim()
{
  ridge_diameter = 51.7;
  ridge_thickness = 2;
  tire_diameter = 47.5;
  tire_width = 21.8;
  axle_reciever_outer_diameter = 11;

  difference() {
      union() {
        // back outer ridge
        translate([0, 0, -tire_width / 2])
        cylinder(h = ridge_thickness, d = ridge_diameter);
        
        // front outer ridge
        translate([0, 0, tire_width / 2])
        cylinder(h = ridge_thickness, d = ridge_diameter);
        
        // tire 
        cylinder(h = tire_width, d = tire_diameter, center = true);
      }
      translate([0,0,1])
      cylinder(h = tire_width + 5, d = tire_diameter - 3, center = true);
    }
    
    // back inner ridge
    difference() {
      translate([0,0, -tire_width /2 + 1])
      cylinder(h = 2, d = tire_diameter);
      translate([0,0, -tire_width /2])
      cylinder(h = 5, d = tire_diameter - 7);
      }
      
      // inner hub
      translate([0,0, -tire_width / 2 + 1])
      {
          cylinder(h = 8, d1 = 20, d2 = 10);
                  
          // radial braces
         for (i = [0 : 5]) {
          angle = 360 / 5 * i;
          rotate([0,0,angle])
          
           difference() {
          translate([-1.5,5,.2])
        
          cube([3, 18, 13]);
          translate([-.5, 0, -.5])
          cylinder(h = 8, d1 = 20, d2 = 10);
        }
       }
        
         // decorative "rivets"
         for (i = [0 : 5]) {
            angle = 360 / 5 * i;
            
            rotate([0,0,angle + 20])
            translate([5,0,-1])
            cylinder(h = 2, d = 1);
          }
  
          translate([0, 0, 7.9])
          // axle reciever
          difference() {
            cylinder(h = axle_reciever_length,  d = axle_reciever_outer_diameter);
            cylinder(h = axle_reciever_length + 1, d = axle_reciever_inner_diameter);
          }
          
          // notch 1
          translate([axle_notch_cutout,-3, 8])
          cube([2, 6, axle_notch_length]);
          
          // notch 2
          translate([-axle_notch_cutout - 2,-3, 8])
          cube([2, 6,  axle_notch_length]);

      }
      
}
tirerim();