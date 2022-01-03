$fn = 100;

fit_padding = 1.01;

// The outer diameter of the hull
outer_d = 31;

// The thickness of sleeves - hull, guide attachment, etc.
sleeve_thickness = 2;

// Calculate the inner diameter of the hull
inner_d = outer_d - 2 * sleeve_thickness;
fit_inner_d = inner_d / fit_padding;

coupler_screw_dia = 3;
coupler_h = 10;
coupler_screw_offset = (coupler_h - coupler_screw_dia) / 2;
screw_mount_width = 7;
screw_mount_depth = 5;
