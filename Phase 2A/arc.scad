// https://raw.org/snippet/circular-sector-and-arcs-with-openscad/
//
// Annular sector module for OpenSCAD
// r1, r2: radii in any order (inner/outer auto-detected)
// a1, a2: start/end angles (degrees; any order; wrap handled)
// $fn: number of segments per 360°
module arc(r1, r2, a1, a2, $fn=128) {
  r0 = min(r1, r2);
  r  = max(r1, r2);

  a = (a1 % 360 + 360) % 360;
  b = (a2 % 360 + 360) % 360;
  d = (b - a) % 360;
  s = d < 0 ? d + 360 : d;       // sweep in [0,360)

  if (s == 0) {
      difference() {
          circle(r=r, $fn=$fn);
          if (r0 > 0) circle(r=r0, $fn=$fn);
      }
  } else {
      k = max(3, ceil($fn * s / 360));
      outer = [ for (i=[0:k]) [ r  * cos(a + s*i/k), r  * sin(a + s*i/k) ] ];
      inner = [ for (i=[0:k]) [ r0 * cos(b - s*i/k), r0 * sin(b - s*i/k) ] ];
      polygon(concat(outer, inner));
  }
}
arc(35, 45, 30, 60);