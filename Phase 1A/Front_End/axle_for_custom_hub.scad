include <../robot_settings.scad>

$fn=50;

module axle(
  axle_length = 45,
  axle_inner_radius = axle_reciever_inner_diameter / 2,
  rotate = true,
  rear_axle = true
)
{
  cutout1 = -axle_notch_cutout;
  cutout2 = axle_notch_cutout;
  
   rotation = rotate ? 180 : 0;
      
  rotate([0,rotation,0])
  {
    
    // inner axle
    difference() {
        // axle
       rotate([0,90,0])
       cylinder(axle_length, r = axle_inner_radius);
      
      // axle notch
       translate([-.1, cutout1 -axle_inner_radius + .2, -axle_inner_radius])
       cube([axle_notch_length, axle_inner_radius, 2 * axle_inner_radius]);
      
       translate([ -.1, cutout2 - .2, -axle_inner_radius])
       cube([axle_notch_length,  axle_inner_radius, 2 * axle_inner_radius]);    
      
        translate([axle_length + .1, 0, 0])
   
        if (rear_axle) {
          // carve out the engine axle insert
          rotate([0, -90, 0])
            cylinder(h = dc_motor_axle_cutout_z, d = dc_motor_axle_cutout_d);          
        }
      }

      // 
      if (!rear_axle) {
        
          // axle cap
          translate([axle_length, 0, 0])
           rotate([0,90,0])
          cylinder(h = 3, d = ball_bearing_outer_diameter);
      }
      else {
        
        // engine axle notch
        translate([
            axle_length - 7, 
            -dc_motor_axle_notch_cutout - 1.5,
            0
          ])
          cube([
            dc_motor_axle_cutout_z, 
            dc_motor_axle_notch_cutout + 1, 
            dc_motor_axle_notch_cutout_z -.7], center = true); 
      }
  }
}
 
axle();
