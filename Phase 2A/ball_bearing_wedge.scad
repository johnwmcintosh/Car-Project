$fn = 100;
cube([1.8 ,1.8, 10]);
rotate([0, 5, 0])
translate([0,0, .1])
cube([1.8,1,5]);
translate([1, 1, 9]) {
  sphere(d = 6);
}