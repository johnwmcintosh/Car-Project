  include <../robot_settings.scad>
$fn = 50;
 
 translate([-3, -70, 0])
 cube([100, 110, rail_thickness], center = true);
   // rail attachments
    difference() {
      union() {
        translate([0,  -rail_length / 2, rail_thickness / 2 - .95]) {
            translate([-main_box_x / 2 + rail_inset - 2.9, 0, 0]) {
              color("blue")
              translate([ .5, 0, 0]) 
              cube([rail_gap, main_box_y, rail_inset - 1.7]);
              
              color("red")
              translate([-4.4, -0, rail_inset - rail_gap - 1.8])
              cube([rail_inset - .1, main_box_y, rail_gap + 1.7]);
            }

          //color("yellow")
            translate([main_box_x / 2 - rail_inset - 4.65, 0, 0]) {
              color("blue")
              translate([0, 0, 0])
              cube([rail_gap, main_box_y, rail_inset - 1.7]);
              
              color("yellow")
              translate([0 , 0, rail_inset - rail_gap - 1.8])
              cube([rail_inset - .1, main_box_y, rail_gap + 1.7]);
              }
          }
      }
    }