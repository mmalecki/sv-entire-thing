include <parameters.scad>
include <rocketscade/tube-coupler.scad>;
use <body-tube.scad>
use <coupler.scad>
use <engine-mount.scad>
use <fins.scad>

e = 0;

couplers = true;
body_tube = true;

engine_mount();

translate([ 0, 0, engine_mount_outer_h - coupler_h + e ]) coupler();
translate([ 0, 0, fin_mount_offset + fin_mount_h ]) {
  if (couplers)
    translate([ 0, 0, -coupler_h + 3 * e ]) coupler();
  if (body_tube)
    translate([ 0, 0, sleeve_thickness + 4 * e ]) body_tube();
}

translate([ 0, 0, 2 * e ]) fins();
