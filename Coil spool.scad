// Parametric filament spool by Woale

// preview[view:south, tilt:top diagonal]

// What's the inner spool width ? Recommended >10mm.
//spool_radius = 44.5;    // for smaller 4+1 coils
spool_radius = 48;    // for larger 7+1 coils

// What's the height of the wire-carrying part of the spool?
spool_height = 82.5;

// What's the (inner) radius of spool's core?
spool_hole_radius = 9.5;

// How thick should the walls (the top and bottom discs and the core) be?
wall_thickness = 4;

// How wide should the rectangular extension be? Use 0 for a cylindrical spool
rectangular_width = 25;

// How large should the winding inset be? Use 0 for no inset
inset_radius = 2.5;

$fn=120;

union() {
    translate([0,-spool_height/2-wall_thickness,rectangular_width/2]) 
    rotate([-90,0,0])
    difference() {
        union() {
            cylinder(h=wall_thickness, r=spool_radius);
            cylinder(h=wall_thickness+spool_height, r=spool_hole_radius+wall_thickness);
            translate([0, 0, wall_thickness+spool_height])
                cylinder(h=wall_thickness, r=spool_radius);
        }
        
        translate([0,0,-1]) 
            cylinder(h=wall_thickness+2*spool_height+2, r=spool_hole_radius);
        translate([0,-spool_radius,-1])
            cylinder(h=wall_thickness+spool_height, r=inset_radius);

        // and remove half of the cylinder to create the printable half-spool
        translate([-spool_radius-1,0,-1])
            cube([2*spool_radius+2, spool_radius+2, spool_height+2*wall_thickness+2]);
    }

    difference() {
        union() {
        translate([-spool_hole_radius-wall_thickness,-spool_height/2-wall_thickness,0])
            cube([2*(spool_hole_radius + wall_thickness),spool_height+2*wall_thickness,rectangular_width/2]);
        translate([-spool_radius,spool_height/2,0])
            cube([2*spool_radius,wall_thickness,rectangular_width/2]);
        translate([-spool_radius,-spool_height/2-wall_thickness,0])
            cube([2*spool_radius,wall_thickness,rectangular_width/2]);
        }
        
        // here we're adding just 1.1 to the height of the cube because, while a 1mm offset
        // below the XY-plane is fine, we don't want to make any appreciable cuts into the
        // spool's core
        translate([-spool_hole_radius,-spool_height/2-wall_thickness-1,-1])
            cube([2*spool_hole_radius,spool_height+2*wall_thickness+2,rectangular_width/2+1.1]);
    }
}