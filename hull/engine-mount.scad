include <parameters.scad>
include <rocketscade/utils.scad>
include <rocketscade/tube-coupler.scad>
include <rocketscade/mounts.scad>

module internal_mounts () {
  radial_cluster(engine_mount_internal_mount_count) {
    translate([(engine_d + engine_mount_sleeve_thickness) / 2, engine_mount_internal_mount_height / 2, engine_mount_h])
      rotate([0, 90, 270])
      render() internal_mount(
        engine_mount_internal_mount_length,
        engine_mount_internal_mount_height,
        engine_mount_internal_mount_slope0,
        engine_mount_internal_mount_slope1,
        engine_mount_internal_mount_thickness
      );
  }
}

module guide_attachment () {
  linear_extrude (guide_attachment_h) {
    difference () {

      translate([(outer_d + guide_d + sleeve_thickness) / 2, 0])
        circle_sleeve(guide_d, sleeve_thickness);

      circle(d = outer_d);
    }
  }
}

module engine_mount () {
  // The base, which connects all the components..
  difference () {
    cylinder(h = engine_mount_base_thickness, d = inner_d);
    cylinder(h = engine_mount_base_thickness, d = engine_d);
  }

  difference () {
    union () {
      // The outer hull.
      cylinder_sleeve(engine_mount_outer_h, inner_d, sleeve_thickness);

      // The actual engine mount.
      cylinder_sleeve(engine_mount_h, engine_d, engine_mount_sleeve_thickness);
    }

    // Allow the holes to reach the engine, both for some runaway screw lengths,
    // as well as optionally holding the motor in place.
    translate([0, 0, engine_mount_outer_h - coupler_screw_offset])
      rotate([0, 0, 45])
        hole_through_radial_cluster(outer_d / 2, 3, coupler_screw_dia, inner_d / 2);
  }

  rotate([0, 0, 90]) guide_attachment();

  internal_mounts();
}

engine_mount();