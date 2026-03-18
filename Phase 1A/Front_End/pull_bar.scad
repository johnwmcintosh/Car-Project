include <../robot_settings.scad>
$fn = 50;

module pull_bar(rotate = false, bar_length_offset = 0) {
  rotation = rotate ? 180 : 0;
  
  rotate([0,rotation,0])
  {
      // push bar
      difference() {
          rotate([0, 90, 0])
          cylinder(h = pull_bar_length + bar_length_offset, r = pull_bar_peg_r);
          translate([-.5, 0, -pull_bar_peg_r])
          cylinder(h = 2 * pull_bar_peg_r, r = pull_bar_peg_r);
        }
        
        // rack fitting
        translate([pull_bar_length + bar_length_offset - .1, 0, 0])
        rotate([0, 90 ,0])
        cylinder(h = 2 * pull_bar_peg_r - .2, d = 2 * pull_bar_peg_r);
        
        translate([pull_bar_length + bar_length_offset + 2 * pull_bar_peg_r - 2.2,  -pull_bar_peg_r - 1, -.9])
        cube([1.9, 1.8, 1]);

        // grabber
      translate([-.5, 0, -1.1])
      difference() {
            translate([0, 0, 1 - pull_bar_peg_r])
            cylinder(h = 2 * pull_bar_peg_r, r = pull_bar_peg_r + 1);
        
            translate([0, 0,  -pull_bar_peg_r])
            cylinder(h = 3* pull_bar_peg_r, r = pull_bar_peg_r);
          }
  }
}
pull_bar();