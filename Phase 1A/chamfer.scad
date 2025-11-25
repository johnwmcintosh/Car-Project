module soft_cube(size = [40, 40, 3], style = "chamfer", radius = 2.5, center = true) {
  if (style == "chamfer") {
    difference() {
      cube(size, center = center);

      // corner chamfers using angled prisms
      for (x_sign = [-1, 1])
        for (y_sign = [-1, 1])
          translate([
            x_sign * (size[0]/2 - radius),
            y_sign * (size[1]/2 - radius),
            center ? -size[2]/2 : 0
          ])
          rotate([0, 0, x_sign * y_sign * 45])
          cube([radius * 2, radius * 0.5, size[2] + 0.1]);
    }
  } else if (style == "rounded") {
    minkowski() {
      cube([
        size[0] - 2 * radius,
        size[1] - 2 * radius,
        size[2] - 2 * radius
      ], center = center);
      sphere(r = radius);
    }
  } else {
    cube(size, center = center);
  }
}
soft_cube(style = "rounded");