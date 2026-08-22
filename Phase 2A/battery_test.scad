use <Battery/Battery_box_LFP.scad>
use <Battery/Battery_LFP.scad>
use <Battery/tobsun.scad>

battery_box();

translate([0, 93, 8])
rotate([0, 0, 180])
lfp_battery();
