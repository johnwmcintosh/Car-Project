include <../robot_settings.scad>

module lfp_battery() {
    hm =  lfp_battery_height - lfp_battery_midterrace_height - lfp_battery_topterrace_height;

    // main body
    translate([-lfp_battery_width / 2, 0, 0])
    cube([lfp_battery_width, lfp_battery_depth, hm]);

    // mid terrice
    diffmw = (lfp_battery_width - lfp_battery_midterrace_width)/2;
    diffmd = (lfp_battery_depth - lfp_battery_midterrace_depth)/2;

    translate([-lfp_battery_width / 2 + diffmw, diffmd, hm])
    color("green")
    cube([lfp_battery_midterrace_width, lfp_battery_midterrace_depth, lfp_battery_midterrace_height]);

    // top terrace
    ht = hm + lfp_battery_midterrace_height;

    difftw = (lfp_battery_width - lfp_battery_topterrace_width)/2;
    difftd = (lfp_battery_depth - lfp_battery_topterrace_depth)/2;

    translate([-lfp_battery_width / 2 + difftw, difftd, ht])
    color("yellow")
    cube([lfp_battery_topterrace_width, lfp_battery_topterrace_depth, lfp_battery_topterrace_height]);
    
    // terminals
    hterm = ht + lfp_battery_topterrace_height;
    leftterm = -lfp_battery_width / 2 + lfp_battery_terminal_width_setback;
    rightterm = lfp_battery_width / 2 - lfp_battery_terminal_width - lfp_battery_terminal_width_setback;
    
    translate([leftterm, lfp_battery_terminal_width_setback, hterm]) {
      color("red")
      cube([lfp_battery_terminal_width, lfp_battery_terminal_depth, 1]);
      translate([0, 7, 0])
      rotate([40, 0, 0])
      color("gold")
      cube([lfp_battery_terminal_width, lfp_battery_terminal_depth, 2]);
    }
    
    translate([rightterm, lfp_battery_terminal_width_setback, hterm]) {
     color("black")
     cube([lfp_battery_terminal_width, lfp_battery_terminal_depth, 1]);
      translate([0, 7, 0])
      rotate([40, 0, 0])
      color("gold")
      cube([lfp_battery_terminal_width, lfp_battery_terminal_depth, 2]);
   }    
}
lfp_battery();