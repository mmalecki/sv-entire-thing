include <parameters.scad>;
include <common.scad>
include <nutsnbolts/cyl_head_bolt.scad>;

nose_cone_top_h = 90;
top_sphere_r = 3;
top_sphere_hull_r = 2;

nose_cone_mount_h = 32;
nose_cone_stopper_offset = 15;

shock_cord_mount_h = 20;
shock_cord_mount_length = 40;
shock_cord_mount_slope_h = 0;
shock_cord_mount_thickness = 2 * sleeve_thickness;

nose_cone_mount_screws = 4;
nose_cone_mount_screw_dia = 3;
nose_cone_mount_screw_size = str("M", nose_cone_mount_screw_dia);
nose_cone_mount_screw_mount_edge = 10;
nose_cone_mount_screw_offset = 5;

module nose_cone_mount_hull () {
  difference () {
    union () {
      cylinder(d = outer_d, h = nose_cone_mount_h);

      translate([0, 0, nose_cone_stopper_offset])
        cylinder(d = outer_d + sleeve_thickness, h = sleeve_thickness);
    }
    cylinder(d = outer_d - sleeve_thickness, h = nose_cone_mount_h);
  }

}
module nose_cone_mount () {
  difference () {
    union () {
      nose_cone_mount_hull();

      radial_cluster(nose_cone_mount_screws) {
        translate([(outer_d - sleeve_thickness) / 2, 0, 0]) {
          difference () {
            translate([-nose_cone_mount_screw_mount_edge, -nose_cone_mount_screw_mount_edge / 2, 0])
              cube([nose_cone_mount_screw_mount_edge, nose_cone_mount_screw_mount_edge, nose_cone_mount_screw_mount_edge]);

            translate([0, 0, nose_cone_mount_screw_offset])
            rotate([0, 90, 0])
              nutcatch_sidecut(nose_cone_mount_screw_size);
          }
        }
      }
    }

    radial_cluster(nose_cone_mount_screws) {
      translate([outer_d / 2, 0, nose_cone_mount_screw_offset]) {
        rotate([0, 90, 0])
          hole_through(name = nose_cone_mount_screw_size, l=10);
      }
    }
  }

  translate([0, 0, nose_cone_mount_h]) {
    cylinder(d = outer_d, h = sleeve_thickness);

    translate([(shock_cord_mount_length + shock_cord_mount_slope_h) / -2, shock_cord_mount_h / 2, sleeve_thickness])
      rotate([90, 0, 0])
        internal_mount(shock_cord_mount_length, shock_cord_mount_h, shock_cord_mount_slope_h, shock_cord_mount_thickness);
  }

}

module nose_cone_positive (d, base_h, h, sphere_r) {
  difference () {
    hull () {
      translate([0, 0, h]) {
        sphere(r = sphere_r);
      }
      cylinder(base_h, d = d);
    };
  }
}

module nose_cone () {
  difference () {
    nose_cone_positive(d = (outer_d * fit_padding) + sleeve_thickness, base_h = nose_cone_base_h, h = nose_cone_top_h, sphere_r = top_sphere_r);
    nose_cone_positive(d = outer_d * fit_padding, base_h = nose_cone_base_h, h = nose_cone_top_h, sphere_r = top_sphere_hull_r);


  for (i = [1 : nose_cone_mount_screws]) {
    rotate([0, 0, i * nose_cone_mount_screw_angle]) {
      translate([outer_d / 2 + sleeve_thickness, 0, nose_cone_mount_screw_offset]) {
        rotate([0, 90, 0])
          hole_through(name = nose_cone_mount_screw_size, l=10);
      }
    }
  }
  }
}

nose_cone_mount();
// nose_cone();
