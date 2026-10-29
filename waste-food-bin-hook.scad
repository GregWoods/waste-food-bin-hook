// Waste food caddy hook — screws to the inside of a cupboard door.
// A round rail stands off from a back plate on a web; the caddy's rear hook
// drops over the rail into the slot between rail and plate.
//
// Modelling axes: X = along the rail, Y = out from the door (y = 0 is the
// door frame face; the recessed panel is at y = -panel_recess), Z = up.
// print_upright rotates it to stand on one end (rail profile on the bed) so
// the rail needs no support and layer lines run across the bending load.
// The plate extends upward so the screws go into the solid frame of a shaker
// door rather than its thin recessed panel.

// ---------- parameters ----------
length        = 80;    // overall width along the door (rail must not exceed 90)
plate_t       = 4;     // back plate thickness — 4 walls on a 0.6 mm nozzle print this solid

// Shaker door: the lower plate sits in the recessed centre panel, the top on the frame.
panel_recess  = 5.5;   // depth of the panel below the frame face (rear packing thickness)
frame_h       = 50;    // thin top section that screws to the door frame
step_to_rail  = 80;    // thick section: from the step down to the top of the rail
step_chamfer  = 2;     // clears the moulding / fillet where panel meets frame

rail_d        = 10;    // rail diameter
below_rail    = 10;    // solid bracket from the rail underside down to the plate bottom
slot_w        = 4;     // gap between rail and plate — caddy's hook plastic is < 1 mm

hole_d        = 4;     // screw clearance (No.6 / 3.5 mm wood screw)
head_d        = 8.5;   // countersink diameter at the front face
hole_from_top = frame_h / 2;   // screw hole distance below the plate top (default: centred on the frame section)
hole_inset    = 22;    // screw hole distance from each end

print_upright = true;

// Test piece: a thin full-height slice of the profile — the same layers as the
// full part when printed upright, just fewer of them.
test_piece    = false;
test_len      = 10;    // slice width along the rail

$fn = 96;

// ---------- derived ----------
rail_r = rail_d / 2;
rail_z = below_rail + rail_r;
panel_top_z = below_rail + rail_d + step_to_rail;  // height of the step (panel's top edge)
plate_h = panel_top_z + frame_h;
rail_y = plate_t + slot_w + rail_r;   // rail centre distance from the door
cs_depth = (head_d - hole_d) / 2;     // 90° countersink
hole_z = plate_h - hole_from_top;
assert(hole_z - head_d / 2 > panel_top_z, "screw holes must sit above the panel, on the frame");

// ---------- geometry ----------
// Every feature runs the full length with square ends, so printed upright the
// ends are flush and there are no overhangs.
module plate() {
    cube([length, plate_t, plate_h]);
}

// Rear packing that fills the recessed panel, so the plate bears flat on it.
module panel_packing() {
    difference() {
        translate([0, -panel_recess, 0]) cube([length, panel_recess + 1, panel_top_z]);
        translate([length / 2, -panel_recess, panel_top_z]) rotate([45, 0, 0])
            cube([length + 2, step_chamfer * sqrt(2), step_chamfer * sqrt(2)], center = true);
    }
}

module rail() {
    translate([0, rail_y, rail_z]) rotate([0, 90, 0]) cylinder(r = rail_r, h = length);
}

// Bracket joining the rail to the plate: flat on top at the rail centre (so the
// slot stays open above) and an angled underside running from the plate bottom
// tangent to the rail. Drawn as a 2D (Y, Z) profile, extruded along X.
module web() {
    rotate([90, 0, 90])
        linear_extrude(length)
            hull() {
                translate([plate_t - 1, 0]) square([1, rail_z]);
                intersection() {
                    translate([rail_y, rail_z]) circle(r = rail_r);
                    translate([rail_y - rail_r, rail_z - rail_r]) square([rail_d, rail_r]);
                }
            }
}

module screw_hole() {
    translate([0, -1, 0]) rotate([-90, 0, 0]) cylinder(d = hole_d, h = plate_t + 2);
    translate([0, plate_t - cs_depth, 0]) rotate([-90, 0, 0])
        cylinder(d1 = hole_d, d2 = head_d, h = cs_depth + 0.01);
    translate([0, plate_t, 0]) rotate([-90, 0, 0]) cylinder(d = head_d, h = 1);
}

module hook() {
    difference() {
        union() {
            plate();
            panel_packing();
            web();
            rail();
        }
        for (x = [hole_inset, length - hole_inset])
            translate([x, 0, hole_z]) screw_hole();
    }
}

module part() {
    if (test_piece)
        intersection() {
            hook();
            translate([0, -panel_recess - 1, -1]) cube([test_len, rail_y + rail_r + panel_recess + 2, plate_h + 2]);
        }
    else
        hook();
}

if (print_upright)
    translate([plate_h, 0, 0]) rotate([0, -90, 0]) part();
else
    part();
