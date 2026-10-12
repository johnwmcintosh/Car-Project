include <../robot_settings.scad>
$fn =100;
use <steering_coupler.scad>
use <axle_for_custom_hub.scad>

translate([-65.5, 0, 0])
rotate([0, 90, 0])
steering_coupler();
axle();