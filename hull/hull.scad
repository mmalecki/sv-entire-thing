include <parameters.scad>
include <rocketscade/utils.scad>;

module hull_ () {
  cylinder_sleeve_with_coupler_holes(body_tube_h, inner_d, sleeve_thickness, coupler_screw_offset, coupler_screw_count, coupler_screw_dia, screw_mount_depth);
}

hull_();
