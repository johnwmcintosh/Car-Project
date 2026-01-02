main_width = 110;
main_depth = 30;
main_thickness = 5;
slot_length = 52;
slot_cutout_thickness = 2.55;
slot_platform_depth = 7.8;
slot_separation = 17.8;

top_board_spacer_depth = 16.2;
top_board_spacer_width = 15;
top_board_spacer_thickness = 2.7;

difference() {
  union() {
    cube([main_width, main_depth, main_thickness], center = true);

    // left wall
    translate([0, slot_separation / 2 - slot_cutout_thickness - .01, -6])
      cube([slot_length, slot_cutout_thickness, slot_platform_depth], center = true);

    // right wall
    translate([0, slot_separation / 2 + slot_cutout_thickness - .01, -6])
      cube([slot_length, slot_cutout_thickness, slot_platform_depth], center = true);

    // floor  
     translate([0, slot_separation / 2, -slot_platform_depth - 3])
      cube([slot_length, 3 * slot_cutout_thickness, 3], center = true);

    translate([0, -slot_separation / 2 - slot_cutout_thickness - .01, -6])
      cube([slot_length, slot_cutout_thickness, slot_platform_depth], center = true);
      
    translate([0, -slot_separation / 2 + slot_cutout_thickness - .01, -6])
      cube([slot_length, slot_cutout_thickness, slot_platform_depth], center = true);

    // floor  
     translate([0, -slot_separation / 2, -slot_platform_depth - 3])
      cube([slot_length, 3 * slot_cutout_thickness, 3], center = true);
      
     translate([slot_length / 2 - top_board_spacer_width / 2, 0, main_thickness / 2 + top_board_spacer_thickness / 2 - .1])
     cube([top_board_spacer_width, slot_platform_depth, top_board_spacer_thickness], center = true);
 }

  translate([0, slot_separation / 2, 0])
  cube([slot_length, slot_cutout_thickness, 20], center = true);

  translate([0, -slot_separation / 2, 0])
  cube([slot_length, slot_cutout_thickness, 20], center = true);
}
