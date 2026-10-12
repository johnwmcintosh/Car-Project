// axle_clip.scad - parametric rebuild of axle_clip.stl
// Reverse-engineered from the mesh: a flat plate with a bottom-open slot
// and two half-round detent bumps that snap over the axle.
// Matches the original STL placement: extruded along X from -10.5 to -8.5.

$fn = 60;

// ---- Parameters (mm) ----
plate_w   = 9.1;   // overall width  (Y)
plate_h   = 8.7;   // overall height (Z)
thick     = 2;     // thickness      (X)

slot_w    = 5.1;   // slot width (axle pocket)
slot_top  = 2.35;  // Z of slot ceiling (plate spans -4.35 .. +4.35)

bump_r    = 0.95;  // detent bump radius
bump_z    = -3.4;  // Z of bump centres (tangent to the open bottom edge)
bump_y_l  = -2.45; // Y of left bump centre  (NOTE: original is asymmetric:
bump_y_r  =  2.55; // Y of right bump centre  left is 0.1 mm inside the wall)
// snap-through gap between bumps = (bump_y_r - bump_r) - (bump_y_l + bump_r) = 3.1

x_start   = 0.0; // X position of the clip's back face (matches original STL)

module profile() {
    difference() {
        square([plate_w, plate_h], center = true);
        // slot, open at the bottom edge
        translate([-slot_w/2, -plate_h/2 - 1])
            square([slot_w, (slot_top + plate_h/2) + 1]);
    }
    // detent bumps; the part outside the slot overlaps solid plate, so no clipping needed
    for (y = [bump_y_l, bump_y_r]) translate([y, bump_z]) circle(r = bump_r);
}

// 2D (a,b) -> 3D (X = extrude, Y = a, Z = b)
translate([x_start, 0, 0])
    rotate([90, 0, 90])
        linear_extrude(height = thick)
            profile();
