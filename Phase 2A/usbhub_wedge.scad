include <robot_settings.scad>

$fn=100;

wedge_thickness = 3;

translate([-10, 0, 0])
cube([20, wedge_thickness, 2 * usbhub_thickness]);

// make it easier to install and remove
translate([0, 0, 2 * usbhub_thickness -5])
difference() {
  translate([-10, 0, 0])
  rotate([0, 90, 0])
  cylinder(h = 20, d = 10);

  translate([-11, 0, -5])
  cube([22, 5, 10]);
}