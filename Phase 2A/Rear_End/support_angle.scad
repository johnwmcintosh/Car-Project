include <../robot_settings.scad>

module support_angle(height = 20, width = 5, depth = 20)
{
    // ===============================
    // Parametric Pythagorean Triangle Cube
    // ===============================

    // Triangle legs
    a = height;   // length of first leg
    b = depth;   // length of second leg

    // Extrusion thickness (depth of the "cube")
    thickness = width;

    // Hypotenuse (computed automatically)
    c = sqrt(a*a + b*b);

    // 2D right triangle
    module right_triangle(a, b) {
        polygon(points=[
            [0,0],
            [a,0],
            [0,b]
        ]);
    }

    // 3D prism from the triangle
    module pythagorean_prism(a, b, thickness) {
        linear_extrude(height = thickness)
            right_triangle(a, b);
    }

    rotate([90, -90, -90])
    // Render the model
    pythagorean_prism(a, b, thickness);

    // Optional: print hypotenuse to console
   // echo("Hypotenuse =", c);

}
support_angle();