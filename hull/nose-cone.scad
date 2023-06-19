include <parameters.scad>;
include <rocketscade/utils.scad>;
include <vendor/nosecones.scad>;

nose_cone_rho = 300;

module nose_cone () {
  difference() {
    cylinder_sleeve(nose_cone_base_h, inner_d, sleeve_thickness);

    translate([ 0, 0, screw_offset ]) {
      rotate([ 0, 0, screw_angle_offset ]) {
        hole_through_radial_cluster(outer_d / 2, 3, coupler_screw_dia, inner_d / 2);
      }
    }
  }

  translate([ 0, 0, nose_cone_base_h ]) {
    difference() {
      cone_ogive_sec(rho = nose_cone_rho, R = outer_d / 2, L = nose_cone_h, s = 50);
      cone_ogive_sec(
        rho = nose_cone_rho, R = inner_d / 2, L = nose_cone_h - sleeve_thickness, s = 50
      );
    }
  }
}

nose_cone();
