include <../robot_settings.scad>

$fn=50;

module axle(
  axle_length = axle_length,
  axle_inner_radius = (axle_reciever_inner_diameter- 0.1) / 2,
  rotate = true,
  rear_axle = false
)
{  
   rotation = rotate ? 180 : 0;
      
  rotate([0,rotation,0])
  {  
      // inner axle
      difference() {
          // axle
         rotate([0,90,0])
         cylinder(axle_length, r = axle_inner_radius);
        
          // axle notch
          translate([-.1, -4, -axle_inner_radius - 2.5])
            cube([axle_notch_length, 2 * axle_inner_radius, axle_inner_radius]);
        
          translate([-.1, -4,  axle_inner_radius / 2 + .4])
            cube([axle_notch_length, 2 * axle_inner_radius, axle_inner_radius]);
        }
        
        // axle cap
        translate([axle_length - 11, 0, 0])
         rotate([0,90,0])
        cylinder(h = 3, d = ball_bearing_outer_diameter + 1.5);
    }
}
 
axle();
