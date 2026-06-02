include <robot_settings.scad>
use <Rear_End/power_bar.scad>

$fn = 50;

module power_bar_mounts(include_power_bar  = false)
{
    
    // power bar stand
    difference() {
      translate([0, 0,  0 ])
      cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);
      
      // pilot hole for screw
      translate([0, 0,  1])
      cylinder(h = power_bar_standoff_z, d = 1.8);
    }

  difference() {
      translate([0, -power_bar_screw_distance,   0])
      cylinder(h = power_bar_standoff_z, d = power_bar_standoff_d);

      // pilot hole for screw
      translate([0, -power_bar_screw_distance,  1])
      cylinder(h = power_bar_standoff_z, d = 1.8);
  }
    
    if (include_power_bar) {
      translate([0, -.3-power_bar_screw_distance / 2, power_bar_standoff_z])
      rotate([0, 0, 90])
        power_bar();
    }
}
power_bar_mounts();