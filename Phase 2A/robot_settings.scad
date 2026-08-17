main_box_x = 100; // 96
main_box_y = 102;
main_box_z = 74; // 74.5

lfp_main_box_x = 65;
lfp_main_box_y = 151;
lfp_main_box_z = 95;

wall_thickness = 2;

rail_gap = 2;
rail_inset = 7;

rail_thickness = 7;
rail_length = 250;
rail_width = 250;

raspberry_pi_screw_seperation_y = 57;
raspberry_pi_screw_seperation_z = 48;
raspberry_pi_peg_h = 5;

battery_box_peg_h = 6;
battery_box_peg_d = 8;
battery_box_peg_cutout = 5;

gears_module = 1;
pinion_gear_teeth = 32;
pinion_gear_width = 5;
pinion_gear_bore = 8;

gears_setback_distance = 25;
gear_post_height = 2 * pinion_gear_width + rail_thickness + 8 ;

steering_motor_mount_x = 45;
steering_motor_mount_y = 36;
steering_motor_mount_z = 18;
steering_motor_mount_setback_distance = gears_setback_distance + 16;

dc_motor_drivertype = "Teyleten"; // Teyleten
isAdafruit = (dc_motor_drivertype == "Adafruit");

drv8871_x = isAdafruit ? 20.3 : 21.6;
drv8871_y = isAdafruit ?  24 : 25;

drv8871_z = 2;
drv8871_screw_d = 2.5;
drv8871_solder_points_z = 2;

drv8871mount_edge_x = 1.5;
drv8871mount_edge_wall = 3;
drv8871mount_z = 5;
drv8871mount_x = drv8871_x +  drv8871mount_edge_wall - 2* drv8871mount_edge_x;
drv8871mount_y = 19;

drv8871_screw_distance = 15.64;
drv8871_solder_points_d = 1.66;
drv8871_solder_offset_y = 4.4;
drv8871_solder_inner_points_distance = 5;
drv8871_solder_outer_points_distance = 12;

dc_motor_75_1_housing_minus_encoder_z = 53.8;
dc_motor_75_1_encoder_z = 14.75;
dc_motor_housing_minus_encoder_z = 48;
dc_motor_encoder_z = 9.33;
dc_motor_encoder_wheel_d = 13.4;
dc_motor_encoder_wheel_thickness = 5;
dc_motor_encoder_wheel_gap = 3;
dc_motor_encoder_circuit_thickness = 2;
dc_motor_cutout_d = 24.8;
dc_motor_cutout_z = 19.5;


M3_shaft_d = 2.82;

dc_motor_screw_head_z = 2;
dc_motor_screw_head_d = 5.6;
dc_motor_screw_d = 3.2;
dc_motor_screw_offset = 8.5;

dc_motor_axle_ring_z = 3;
dc_motor_axle_ring_d = 7.2;
dc_motor_axle_cutout_d = 4.2;
dc_motor_axle_cutout_z = 10;
dc_motor_axle_notch_cutout = 0.4;
dc_motor_axle_notch_cutout_z = 6;

pdmount_x = 20;
pdmount_y = 30;
pdmount_z = 2;
pdmount_edge_x = 1.5;
pdmount_edge_wall = 3;

steering_shaft_z = 45;
steering_shaft_d = 7;
steering_shaft_motor_fitting_d = 9;
coupler_length = 24.6;
coupler_diameter = 14;
coupler_screw_d = 4;
coupler_screw_z_offset = 5;
coupler_gear_side_insert = 12.6;
steering_shaft_with_coupler_z = steering_shaft_z - coupler_gear_side_insert;

lidar_mount_y = 110;
lidar_mount_x = 65 + 20;
lidar_narrow_screws = 40;
lidar_wide_screws = 56;
lidar_front_to_back_screws = 70;
lidar_screw_d = 3;
lidar_circuitboard_x = 20;
lidar_circuitboard_y = 35;
lidar_circuitboard_z = 1.2;
lidar_cord_length = 29;

ball_bearing_height = 7;
ball_bearing_outer_diameter = 22;
ball_bearing_inner_diameter = 8;

M4_diameter = 5.1;
M3_diameter = 2.9;
M3_length = 35;
M3_cap_length= 3;
M3_cap_diameter = 5.44;

suspension_spring_outer_diameter = 8;
suspension_spring_inner_diameter = 5.3;

armature_holder_height = 20;
armature_holder_thickness = 8;
pull_bar_peg_r = 3.2;
apparatus_locking_peg_d = 4;

rack_module = 1;
rack_length = main_box_x;
rack_height = 5;
rack_width = 10;
rack_teeth = 30;
rack_bore = 3;

pull_bar_length = rail_width / 2 - rack_length + 1;

// tire hardware
axle_length = 24 + ball_bearing_height; 
axle_reciever_inner_diameter = 8.2;
axle_reciever_outer_diameter = 12;
axle_reciever_length = 18.8;
axle_notch_length = 15;
axle_notch_cutout = 2.4;

// power distribution bar
power_bar_cutout_x = 96;
power_bar_y = 19.1;
power_bar_z = 1.5;
power_bar_screw_distance = 91.4;
power_bar_screw_d = 2.8;
power_bar_standoff_z = 5;
power_bar_standoff_d = 6.83;

pico_expander_width = 63;
pico_expander_height = 57;
pico_screw_hole_offset = 3;
pico_screw_hole_d = 2.5;

usbhub_thickness = 11.7;
usbhub_depth = 37.5;
usbhub_width = 86.7;
usbhub_end_port_width = 14.8;
usbhub_end_port_height = 12;
usbhub_front_face_safe_zone_left = 15;
usbhub_front_face_safe_zone_right = 14.8;

switch_w = 16;
switch_cutout_d = 12.2;
switch_bump_h = 2;
switch_bump_l = 18.2;

i2c_mount_thickness = 3;
i2c_w = 28;
i2c_l = 28;
i2c_circuitboard_thickness = 1.23;
i2c_bottom_notch_w = 14.35;
i2c_bottom_notch_depth = 1;
i2c_screw_hole_d = 1.9;
i2c_screw_hole_offset = 1.4;
i2c_pin_l = 11;
i2c_pin_d = 0.8;
i2c_pin_offset = 1.5;
i2c_pin_separation = 2.5;
i2c_all_pins_l = 8.3;
i2c_screen_thickness = 1.88;
i2c_screen_w = 14.6;
i2c_screen_d = 27;
i2c_screen_offset = 4.1;