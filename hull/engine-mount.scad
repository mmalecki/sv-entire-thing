include <parameters.scad>
include <common.scad>
include <rocketscad/utils.scad>

base_thickness = 5;
stabilizer_h = 70;
stabilizer_edge_r = 1;
stabilizer_slope_h = 60;

stabilizer_offset = (outer_d + sleeve_thickness) / 2;

internal_mounts = 3;

internal_mount_h = 10;
internal_mount_length = 50;
internal_mount_offset = 185;
internal_mount_slope_h = 20;

guide_d = 5 * 1.1;
guide_h = stabilizer_length * 0.9;

module stabilizer () {
  hull () {
    cube([stabilizer_length, stabilizer_thickness, stabilizer_h]);
    translate([stabilizer_length, stabilizer_thickness / 2, 0])
      cylinder(r = stabilizer_edge_r, h = stabilizer_h);


    translate([0, stabilizer_thickness / 2, stabilizer_h])
      cylinder(r = stabilizer_edge_r, h = stabilizer_slope_h);
  };
}

module guide_attachment () {
  cylinder_sleeve(guide_h, guide_d, sleeve_thickness);
}

module engine_mount () {
  translate([0, 0, -base_thickness]) {
    difference () {
      cylinder(h = base_thickness, d = outer_d + sleeve_thickness);
      cylinder(h = base_thickness, d = engine_d);
    }

    radial_cluster(stabilizers) {
      translate([stabilizer_offset, -stabilizer_thickness / 2, 0])
        stabilizer();
    }
  }

  cylinder_sleeve(engine_mount_h, engine_d, engine_mount_sleeve_thickness);

  cylinder_sleeve(hull_h, outer_d, sleeve_thickness);

  radial_cluster(internal_mounts) {
    translate([(outer_d / 2) , -internal_mount_h / 2, internal_mount_offset])
      rotate([0, 90, 90])
        internal_mount(internal_mount_length, internal_mount_h, internal_mount_slope_h, sleeve_thickness);
  }

  rotate([0, 0, 45])
    translate([outer_d / 2 + 1.5 * sleeve_thickness, 0, -base_thickness])
      guide_attachment();
}

engine_mount();
