
$fn = 50;

difference() {
difference() {
    union() {
        translate([-2, 0, 4])
        rotate([0, -30, 0])
        cylinder(h = 10, d = 4, center = true);

        translate([2, 0, 4])
        rotate([0, 30, 0])
        cylinder(h = 10, d = 4, center = true);

        translate([0, 0, -4])
        cylinder(h = 10, d = 4, center = true);
    }

    translate([0, 1, 0])
    cube([20, 2, 20], center = true);
}

translate([-3.2, 0, 6])
rotate([0, -30, 0])
cylinder(h = 13, d = 2,  center = true);

translate([3.2, 0, 6])
rotate([0, 30, 0])
cylinder(h = 13, d = 2,  center = true);

translate([0, 0, -6])
cylinder(15, d = 2, center = true);
}
