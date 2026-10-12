include <../robot_settings.scad>

$fn=50;

module axle(
  axle_length = axle_length,
  axle_inner_radius = (axle_reciever_inner_diameter) / 2,
  rotate = true,
  rear_axle = false,
  show_axle = true,
  show_clip = false
)
{  
   rotation = rotate ? 180 : 0;
      
  rotate([0,rotation,0])
  {  
    if (show_axle) {
          // inner axle
          difference() {
              // axle
              color("red")
              translate([axle_notch_length + 8 -.2, 0, 0])
             rotate([0,90,0])
             cylinder(axle_length, d = axle_reciever_inner_diameter - .2); 


             // notch for coupler screw
             translate([axle_length + axle_notch_length + 1, 0,4])
             color("green")
             cylinder(coupler_screw_d/2, center = true);

             // notch for coupler screw
             translate([axle_length + axle_notch_length + 1,0,-4])
             color("blue")
             cylinder(coupler_screw_d/2, center = true);
          }

             
          difference() {
            // tire insert part of axle
            color("green")
            translate([axle_notch_length - 3.5, 0,  0 ])
            cube([axle_notch_length + 8, axle_reciever_inner_diameter - 1.48, 3.8], center = true);

            // notches for a clip
            translate([9.5, -axle_inner_radius, 0])
            cube([3, 2.5, 10], center = true);
            
            translate([9.5, axle_inner_radius, 0])
            cube([3, 2.5, 10], center = true);
          }
                  
          // axle cap
          translate([axle_length + 8, 0, 0])
           rotate([0,90,0])
            cylinder(h = 3, d = ball_bearing_outer_diameter + 1.5);
       }
          
        // clip
        if (show_clip) {
              translate([9.5, 0, -axle_inner_radius + .7])
              cube([2, 8, 2], center = true);
              
               translate([9.5, -axle_inner_radius + .5, 0])
              cube([2, 2, 8.7], center = true);
              
              translate([9.5, axle_inner_radius- .5, 0])
              cube([2, 2,8.7], center = true);
              
              translate([8.5, -axle_inner_radius + 1.6, 3.4])
              rotate([90, 0, 90])
              cylinder(2, d = 1.9);
              
              translate([8.5, axle_inner_radius - 1.5, 3.4])
              rotate([90, 0, 90])
              cylinder(2, d = 1.9);
         }
    }
}
 
axle();
