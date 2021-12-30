module internal_mount_positive (length, height, slope) {
  polygon(points = [[0, 0], [slope, height], [length, height], [length + slope, 0]]);
}

module internal_mount (length, height, slope, thickness) {
  linear_extrude(height = height) {
    difference () {
      internal_mount_positive(length, height, slope);
      translate([thickness, 0, 0])
        internal_mount_positive(length - 2 * thickness, height - thickness, slope);
    }
  }
}

module radial_cluster (count) {
  angle = 360 / count;
  for (i = [1 : angle]) {
    rotate([0, 0, i * angle]) {
      children();
    }
  }
}

module sleeve(h, inner_d, thickness) {
  difference () {
    cylinder(h = h, d = inner_d + thickness);
    cylinder(h = h, d = inner_d);
  }
}
