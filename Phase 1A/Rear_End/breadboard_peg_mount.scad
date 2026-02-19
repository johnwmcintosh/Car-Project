   include <../robot_settings.scad>
   
   use <breadboard_mount.scad>
   use <breadboard_pegs.scad>
   $fn = 50;
   
   breadboard_mount();
   translate([0, 0, -raspberry_pi_peg_h - 2.2])
   {
     translate([breadboard_width / 2 -power_bar_screw_d, breadboard_length / 2 - power_bar_screw_d, 0])
     cylinder(h = raspberry_pi_peg_h, d = power_bar_screw_d, center = true);
     
     translate([breadboard_width / 2 -power_bar_screw_d, -breadboard_length / 2 + power_bar_screw_d, 0])
      cylinder(h = raspberry_pi_peg_h, d =  power_bar_screw_d,  center = true);
     
     translate([-breadboard_width / 2 +power_bar_screw_d, -breadboard_length / 2 + power_bar_screw_d, 0])
      cylinder(h = raspberry_pi_peg_h, d =  power_bar_screw_d,  center = true);
     
     translate([-breadboard_width / 2  + power_bar_screw_d, breadboard_length / 2 - power_bar_screw_d, 0])
      cylinder(h = raspberry_pi_peg_h, d =  power_bar_screw_d,  center = true);

    //translate([0,0, -.6]) 
   //breadboard_pegs();
   }
