include <rocketscade/tube-coupler.scad>;
include <parameters.scad>;
include <vendor/nosecones.scad>;

nose_cone_rho = 400;

module nose_cone () {
  difference () {
    cone_ogive_sec(rho = nose_cone_rho, R = outer_d / 2, L = nose_cone_h, s = 50);
    cone_ogive_sec(rho = nose_cone_rho, R = inner_d / 2, L = nose_cone_h - sleeve_thickness, s = 50);

    translate([0, 0, coupler_screw_offset]) {
      rotate([0, 0, 45]) {
        hole_through_radial_cluster(outer_d / 2, 3, coupler_screw_dia, inner_d / 2);
      }
    }
  }
}

nose_cone();
