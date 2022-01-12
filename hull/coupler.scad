include <parameters.scad>;
include <rocketscade/tube-coupler.scad>;

module coupler () {
  rotate([0, 0, 45])
    tube_coupler(
      d1 = fit_inner_d - 2 * sleeve_thickness,
      d2 = fit_inner_d - 2 * sleeve_thickness,
      h1 = coupler_h,
      h2 = coupler_h,
      h_stopper = sleeve_thickness,
      screw_dia = coupler_screw_dia,
      nutcatch_offset = screw_mount_nutcatch_offset,
      screw_offset = coupler_screw_offset,
      screw_mount_width = screw_mount_width,
      screw_mount_depth = screw_mount_depth,
      sleeve_thickness = sleeve_thickness
    );
}

coupler();
