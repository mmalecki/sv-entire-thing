include <parameters.scad>;
include <rocketscade/nose-cone-mount.scad>;

module nose_cone_mount_ () {
  rotate([0, 0, 45])
    nose_cone_mount(
      d1 = fit_inner_d - 2 * sleeve_thickness,
      d2 = fit_inner_d - 2 * sleeve_thickness,
      h1 = coupler_h,
      h2 = coupler_h,
      h_stopper = sleeve_thickness,
      screw_dia = coupler_screw_dia,
      nutcatch_offset = screw_mount_depth / 4,
      screw_offset = coupler_screw_offset,
      screw_mount_width = screw_mount_width,
      screw_mount_depth = screw_mount_depth,
      sleeve_thickness = sleeve_thickness,
      mount_length = nose_cone_mount_mount_length,
      mount_height = nose_cone_mount_mount_height,
      mount_slope0 = 0,
      mount_slope1 = 0,
      mount_thickness = sleeve_thickness
    );
}

nose_cone_mount_();
