include <parameters.scad>
include <rocketscade/utils.scad>
include <rocketscade/fin.scad>
include <rocketscade/tube-coupler.scad>

module fins () {
  translate([0, 0, fin_mount_offset]) {
    difference () {
      cylinder_sleeve(fin_mount_h, inner_d, sleeve_thickness);

      rotate([0, 0, screw_angle_offset]) {
        translate([0, 0, screw_offset])
          hole_through_radial_cluster(outer_d / 2, 3, coupler_screw_dia, screw_mount_depth);

        translate([0, 0, fin_mount_h - screw_offset])
          hole_through_radial_cluster(outer_d / 2, 3, coupler_screw_dia, screw_mount_depth);
      }
    }
  }

  // This is ugly: cut out parts of the fin using a hull-sized cylinder.
  difference () {
    radial_cluster(fin_count) {
      translate([outer_d / 2, 0, 0])
        fin(fin_root_chord, fin_height, fin_sweep_length, fin_tip_chord, fin_fillet_r);
    }
    translate([0, 0, -fin_fillet_r])
      cylinder(h = fin_mount_offset + fin_fillet_r, d = outer_d);
  }
}

fins();
