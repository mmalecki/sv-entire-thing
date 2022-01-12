include <parameters.scad>;
include <rocketscade/utils.scad>;
include <rocketscade/tube-coupler.scad>;

module supporting_mount () {

  translate([engine_d / 2 + engine_mount_sleeve_thickness, engine_mount_internal_mount_height / 2, 0]) {
    rotate([90, 0, 0]) {
      linear_extrude(engine_mount_internal_mount_height, $fn = 1, convexity = 1)
        polygon(
          points = [
            [-engine_mount_internal_mount_inset, engine_mount_h], 
            [-engine_mount_internal_mount_inset, engine_mount_h - engine_mount_internal_mount_thickness],
            [(inner_d - engine_d) / 2 - 2 * sleeve_thickness, 0],
            [(inner_d - engine_d) / 2 - sleeve_thickness, 0],
          ]
        );
    }
  }
}

module internal_mounts () {
  radial_cluster(engine_mount_internal_mount_count) supporting_mount();
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
  linear_extrude (engine_mount_base_thickness) {
    difference () {
      circle(d = inner_d);
      circle(d = engine_d);
    }
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
    translate([0, 0, engine_mount_outer_h - screw_offset])
      rotate([0, 0, 45])
        hole_through_radial_cluster(outer_d / 2, 3, coupler_screw_dia, inner_d / 2);
  }

  rotate([0, 0, 90]) guide_attachment();

  internal_mounts();
}

engine_mount();
