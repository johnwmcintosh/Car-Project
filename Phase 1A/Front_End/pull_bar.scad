include <../robot_settings.scad>
$fn = 50;

module pull_bar(bar_length = rail_width / 2 - rack_length + 1, rotate = false) {
  rotation = rotate ? 180 : 0;
  
  rotate([0,rotation,0])
  {
      // push bar
      difference() {
          rotate([0, 90, 0])
          cylinder(h = bar_length, r = pull_bar_radius);
          translate([-.5, 0, -pull_bar_radius])
          cylinder(h = 2 * pull_bar_radius, r = pull_bar_radius);
        }
        
        // rack fitting
        translate([bar_length - .1, -pull_bar_radius, -pull_bar_radius])
        cube(2 * pull_bar_radius);

        // grabber
      translate([-.5, 0, -1.1])
      difference() {
            translate([0, 0, 1 - pull_bar_radius])
            cylinder(h = 2 * pull_bar_radius, r = pull_bar_radius + 1);
            translate([0, 0,  -pull_bar_radius])
            cylinder(h = 3* pull_bar_radius, r = pull_bar_radius);
          }
  }
}
pull_bar();