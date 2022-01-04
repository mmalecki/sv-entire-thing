include <parameters.scad>
use <engine-mount.scad>
use <fins.scad>
use <hull.scad>
use <coupler.scad>
include <rocketscade/tube-coupler.scad>;

slack = 1.01;

engine_mount();

translate([0, 0, (engine_mount_outer_h - coupler_h) * slack]) coupler();
// translate([0, 0, (fin_mount_offset + fin_mount_h - coupler_h) * slack]) coupler();
// translate([0, 0, (fin_mount_offset + fin_mount_h + sleeve_thickness) * slack]) hull_();

// fins();
