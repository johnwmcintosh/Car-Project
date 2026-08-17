
include <robot_settings.scad>

use  <i2c.scad>

$fn=100;

module i2c_mount(show_screen = true)
{
    if (show_screen) {
        i2c();
    }
    cube([i2c_w  + i2c_mount_thickness, i2c_l + i2c_mount_thickness, i2c_mount_thickness]);
  
}

i2c_mount();