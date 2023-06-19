include <parameters.scad>;
include <rocketscade/hull-utils.scad>;

module body_tube () {
  rotate([ 0, 0, screw_angle_offset ]) cylinder_sleeve_with_coupler_holes(
    body_tube_h, inner_d, sleeve_thickness, coupler_screw_offset, coupler_screw_count,
    coupler_screw_dia, screw_mount_depth
  );
}

hull_();
