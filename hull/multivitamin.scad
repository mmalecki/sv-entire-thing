include <parameters.scad>
use <launch-pad.scad>
use <engine-mount.scad>
use <guidance-node.scad>
use <nose-cone.scad>

h = 115;
slack = 1.1;

translate([0, 0, (launch_pad_depth + stabilizer_stand_h - stabilizer_notch_h) * slack]) {
  engine_mount();

  color([0, 0, 1]) cylinder(h = h, d1 = outer_d_bottom, d2 = outer_d_top);

  translate([0, 0, engine_mount_h + slack]) {
    rotate([0, 0, 45])
      guidance_node(outer_d_bottom);
  }

  translate([0, 0, h - nose_cone_base_h]) {
    nose_cone();

    translate([0, 0, -guidance_node_h - slack])

    rotate([0, 0, 45])
      guidance_node(outer_d_top);
  }
}

rotate([0, 0, 45])
  launch_pad();
