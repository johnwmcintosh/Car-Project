   include <../robot_settings.scad>
   $fn = 50;
   
    module breadboard_pegs(show_platform = true)
    {
       // pegs for battery_box
       translate([0, 0, -.55])
       {
       translate([breadboard_width / 2 -power_bar_screw_d, breadboard_length / 2 - power_bar_screw_d, 0])
         {
            difference() {
               cylinder(h = raspberry_pi_peg_h, d = 2 * power_bar_screw_d,  center = true);
               translate([0, 0, raspberry_pi_peg_h - raspberry_pi_peg_h + 1])
                 cylinder(h = raspberry_pi_peg_h + 1, d =  power_bar_screw_d + .22,  center = true);
            }
         }

     translate([-breadboard_width / 2 + power_bar_screw_d, -breadboard_length / 2 + power_bar_screw_d, 0])
         {
            difference() {
               cylinder(h = raspberry_pi_peg_h, d = 2 * power_bar_screw_d,  center = true);
               translate([0, 0, raspberry_pi_peg_h - raspberry_pi_peg_h + 1])
                 cylinder(h = raspberry_pi_peg_h + 1, d =  power_bar_screw_d  + .22,  center = true);
            }
         }

     translate([-breadboard_width / 2 + power_bar_screw_d, breadboard_length / 2 - power_bar_screw_d, 0])
         {
            difference() {
               cylinder(h = raspberry_pi_peg_h, d = 2 * power_bar_screw_d,  center = true);
               translate([0, 0, raspberry_pi_peg_h - raspberry_pi_peg_h + 1])
                 cylinder(h = raspberry_pi_peg_h + 1, d =  power_bar_screw_d + .22,  center = true);
            }
         }

     translate([breadboard_width / 2 - power_bar_screw_d, -breadboard_length / 2 + power_bar_screw_d, 0])
     {
         difference() {
             cylinder(h = raspberry_pi_peg_h, d = 2 * power_bar_screw_d,  center = true);
             translate([0, 0, raspberry_pi_peg_h - raspberry_pi_peg_h + 1])
               cylinder(h = raspberry_pi_peg_h + 1, d =  power_bar_screw_d + .22,  center = true);
             //translate([1, -power_bar_screw_d / 2, -2.8])
             //cube([power_bar_screw_d, power_bar_screw_d, 10]);
          }

        }     
    }
    
    if (show_platform)
    {
      translate([0, 0, -raspberry_pi_peg_h])
      cube([breadboard_width, breadboard_length, 4], center = true);
    }
}
breadboard_pegs();
