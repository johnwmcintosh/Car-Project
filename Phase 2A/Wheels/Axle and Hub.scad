use <../Front_End/axle_for_custom_hub.scad>
use <../Front_End/tire_rim.scad>

$fn = 100;

translate([15, 0, 0])
axle();

rotate([0, 270, 0])
tirerim();