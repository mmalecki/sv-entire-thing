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

