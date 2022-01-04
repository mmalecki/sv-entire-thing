$fn = 30;

fit_padding = 1.01;

// The outer diameter of the hull
outer_d = 37;

// The thickness of sleeves - hull, guide attachment, etc.
sleeve_thickness = 1.6;

// Calculate the inner diameter of the hull
inner_d = outer_d - 2 * sleeve_thickness;
fit_inner_d = inner_d / fit_padding;

coupler_screw_dia = 3;
coupler_h = 5;
coupler_screw_offset = coupler_h / 2;
coupler_screw_count = 3;
screw_mount_width = 7;
screw_mount_depth = 4;

engine_mount_base_thickness = 4;
engine_mount_sleeve_thickness = 1.6;
engine_mount_h = 40;
engine_mount_outer_h = 20;
engine_d_fit_padding = 1.01325;
engine_d = 18 * engine_d_fit_padding;

engine_mount_internal_mount_count = 1;
engine_mount_internal_mount_length = 20;
engine_mount_internal_mount_height = 4.5;
engine_mount_internal_mount_slope0 = 0;
engine_mount_internal_mount_slope1 = 10;
engine_mount_internal_mount_thickness = 1.2;

guide_padding = 1.15;
guide_d = 10 * guide_padding;
guide_attachment_h = 50;

fin_count = 3;
fin_root_chord = 50;
fin_height = 70;
fin_sweep_length = 70;
fin_tip_chord = 0;
fin_fillet_r = 0.8;
fin_mount_offset = engine_mount_outer_h + sleeve_thickness;
fin_mount_h = fin_root_chord - fin_mount_offset + fin_fillet_r;

body_tube_h = 200 - (fin_mount_h + engine_mount_outer_h + 2 * sleeve_thickness);

nose_cone_h = 100;
nose_cone_mount_mount_length = 20;
nose_cone_mount_mount_height = 20;
