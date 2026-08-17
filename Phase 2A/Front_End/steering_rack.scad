include <../robot_settings.scad>
use <OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <MCAD/involute_gears.scad>
use <pull_bar.scad>
$fn = 50;

module steering_rack(show_pullbars = true, show_rack = true) {
  
  if (show_rack) {
      difference() {
        translate([0, rack_width / 2, 0])
         zahnstange(rack_module, rack_length, rack_height, rack_width);

        // rt side
        translate([-rack_length / 2 - 2 * pull_bar_peg_r, 0 , rack_height - pull_bar_peg_r - 2])
        {
            // pull bar cutout
            rotate([0, 90, 0])
            cylinder(h= 15, d = 2 * pull_bar_peg_r);

            // short cutout
            translate([13, -9,  -.45])
            cube([2, rack_width, rack_height]);
        }
        
        // rt side long way cutout
        translate([-rack_length / 2 - 1.4, -1, rack_height - 3])
        cube([10, 2, 4]);
        
        // lft side long way cutout
        translate([rack_length / 2 - 5, -1, rack_height - 3])
        cube([10, 2, 4]);
        
        // lft side short way cutout and locking peg
         translate([rack_length / 2 - 2 * pull_bar_peg_r, 0 , rack_height - pull_bar_peg_r  - 2])
         {
            // pull bar fitting
            rotate([0, 90, 0])
            cylinder(h= 15, d = 2 * pull_bar_peg_r); 

            // short cutout
            translate([0, -9,  -.45])
            cube([2, rack_width, rack_height]);
        } 
      }
    }
    
    if (show_pullbars)
    {
      // lft pull bar
      bar_length_offset = 29.53;
      translate([rack_length + bar_length_offset, 0, 4.9])
      pull_bar(rotateit = false, bar_length_offset);
      
      //rt pull bar
      //bar_length_offset = 29.53;
      translate([-rack_length - bar_length_offset + 2.2, 0, 4.9])
      rotate([180,0,180])
      pull_bar(rotateit = true, bar_length_offset);
    }
}
steering_rack();