include <../robot_settings.scad>
$fn = 50;

module pull_bar(bar_length = rail_width / 2 - rack_length + 1, rotate = false) {
  rotation = rotate ? 180 : 0;
  
  rotate([0,rotation,0])
  {
      // push bar
      difference() {
          rotate([0, 90, 0])
          cylinder(h = bar_length, r = pull_bar_peg_r);
          translate([-.5, 0, -pull_bar_peg_r])
          cylinder(h = 2 * pull_bar_peg_r, r = pull_bar_peg_r);
        }
        
        // rack fitting
        translate([bar_length - .1, -pull_bar_peg_r, -pull_bar_peg_r])
        cube(2 * pull_bar_peg_r);

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