include <../robot_settings.scad>
use <OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>
use <pull_bar.scad>
$fn = 50;

module steering_rack() {
      difference() {
        translate([0, rack_width / 2, 0])
         zahnstange(rack_module, rack_length, rack_height, rack_width);

      
         translate([-rack_length / 2, 0 , rack_height - pull_bar_peg_r - 2])
        rotate([0, 90, 0])
            cylinder(h= 15, d = 2 * pull_bar_peg_r);

        
        translate([rack_length / 2 - 5, -1, rack_height - 3])
        cube([10, 2, 4]);
        
         translate([rack_length / 2 - 2 * pull_bar_peg_r, 0 , rack_height - pull_bar_peg_r  - 2])
         {
            rotate([0, 90, 0])
            cylinder(h= 15, d = 2 * pull_bar_peg_r); 
            
            translate([0, -9,  0])
            cube([2, rack_width, rack_height]);
        } 
      }
      
      bar_length_offset = 29.53;
      translate([rack_length + bar_length_offset, 0, 4.9])
      pull_bar(rotate = true, bar_length_offset);
      

      


}
steering_rack();