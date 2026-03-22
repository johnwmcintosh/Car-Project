   include <../robot_settings.scad>
   $fn = 50;
 
 module battery_box_peg_mounts(
  show_mounts = true,
  show_points = false) 
  {

if (show_mounts) 
{
  // temporary base platform
  //translate([0, 0, battery_box_peg_d / 2 + 3])
  //cube([main_box_x, main_box_y, 2]);
  
   translate([0, 0, battery_box_peg_d / 2 + .1])
   {
     color("green")
    translate([battery_box_peg_d, battery_box_peg_d, 0])
      difference() {
        cylinder(h = battery_box_peg_h, d = battery_box_peg_d, center = true);
       translate([0, 0, -.1])
        cylinder(h = battery_box_peg_h + 1, d = battery_box_peg_cutout, center = true); 
      }

  color("red")
    translate([-battery_box_peg_d + main_box_x, battery_box_peg_d, 0])
      difference() {
        cylinder(h = battery_box_peg_h, d = battery_box_peg_d, center = true);
       translate([0, 0, -.1])
        cylinder(h = battery_box_peg_h + 1, d = battery_box_peg_cutout, center = true); 
      }

  color("white")
    translate([-battery_box_peg_d + main_box_x, -battery_box_peg_d + main_box_y, 0])
      difference() {
        cylinder(h = battery_box_peg_h, d = battery_box_peg_d, center = true);
       translate([0, 0, -.1])
        cylinder(h = battery_box_peg_h + 1, d = battery_box_peg_cutout, center = true); 
      }
     
    translate([battery_box_peg_d, -battery_box_peg_d + main_box_y, 0])
      difference() {
        cylinder(h = battery_box_peg_h, d = battery_box_peg_d, center = true);
       translate([0, 0, -.1])
        cylinder(h = battery_box_peg_h + 1, d = battery_box_peg_cutout, center = true); 
      } 
    }
  }
    if (show_points) {
      // temporary base platform
     //translate([0,0, -battery_box_peg_h + 2])
      //cube([main_box_x, main_box_y, 2]);
      
      cutout_offset = .4;
      
      // battery box attachment points
       translate([0, 0, battery_box_peg_d / 2 - battery_box_peg_h - .1]) 
      {
        translate([battery_box_peg_d, battery_box_peg_d, 0])
        cylinder(h = battery_box_peg_h, d = battery_box_peg_cutout - cutout_offset);

        translate([-battery_box_peg_d + main_box_x, battery_box_peg_d, 0])
        cylinder(h = battery_box_peg_h, d = battery_box_peg_cutout - cutout_offset);

        translate([-battery_box_peg_d + main_box_x, -battery_box_peg_d + main_box_y, 0])
        cylinder(h = battery_box_peg_h, d = battery_box_peg_cutout - cutout_offset);

        translate([battery_box_peg_d, -battery_box_peg_d + main_box_y, 0])
        cylinder(h = battery_box_peg_h, d = battery_box_peg_cutout - cutout_offset);
       }
   }

}
battery_box_peg_mounts();