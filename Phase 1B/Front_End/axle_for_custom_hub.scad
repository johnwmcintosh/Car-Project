include <../robot_settings.scad>

$fn=50;

module axle(
  axle_length = axle_length,
  axle_inner_radius = (axle_reciever_inner_diameter- 0.1) / 2,
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
              translate([axle_notch_length + 8 -.2, 0, 0])
             rotate([0,90,0])
             cylinder(axle_length, d = ball_bearing_inner_diameter - .2); 
           }

          difference() {
            // tire insert part of axle
            translate([0, -7 / 2,  -axle_inner_radius / 2 - .25 ])
            cube([axle_notch_length + 8, 6.9, axle_inner_radius + .7]);

            // notches for a clip
            translate([9.5, -axle_inner_radius + .5, 0])
            cube([3, 2, 10], center = true);
            
            translate([9.5, axle_inner_radius- .5, 0])
            cube([3, 2, 10], center = true);
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
