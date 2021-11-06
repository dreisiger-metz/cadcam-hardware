// Parametric filament spool by Woale

// preview[view:south, tilt:top diagonal]

// Configuration parameters in mm
base_x                = 120;
base_y                = 30;
base_z                = 8;

body_x                = 60;
body_d                = 38;

mounting_bolt_r       = 7;

neg_offset            = 1;

$fn=48*2;


difference() {
    union() {
        // the base
        translate([base_y/2, base_y/2, 0])         cylinder(r=base_y/2, h=base_z);
        translate([base_x-base_y/2, base_y/2, 0])  cylinder(r=base_y/2, h=base_z);
        translate([base_y/2, 0, 0])                cube([base_x-base_y, base_y, base_z]);

        translate([(base_x-body_x)/2, 0, base_z])  cube([body_x, base_y, body_d/2-1]);
        
    }
    
    union() {
        translate([0, (base_y-mounting_bolt_r)/2, -neg_offset])
            cube([(base_x-body_x)/2-1-mounting_bolt_r/2, mounting_bolt_r, base_z+2*neg_offset]); 
        translate([(base_x-body_x)/2-1-mounting_bolt_r/2, (base_y-mounting_bolt_r)/2+mounting_bolt_r/2, -neg_offset])
            cylinder(r=mounting_bolt_r/2, h=base_z+2*neg_offset);
        
        translate([base_x-(base_x-body_x)/2+1+mounting_bolt_r/2, (base_y-mounting_bolt_r)/2, -neg_offset])
            cube([(base_x-body_x)/2-1-mounting_bolt_r/2, mounting_bolt_r, base_z+2*neg_offset]);
//        translate([base_y+body_x+1-mounting_bolt_r/2, (base_y-mounting_bolt_r)/2+mounting_bolt_r/2, -neg_offset])
        translate([base_x-(base_x-body_x)/2+1+mounting_bolt_r/2, (base_y-mounting_bolt_r)/2+mounting_bolt_r/2, -neg_offset])
            cylinder(r=mounting_bolt_r/2, h=base_z+2*neg_offset);

        translate([base_x/2, -neg_offset, base_z+body_d/2]) rotate([-90,0,0]) cylinder(d=body_d, h=base_y+2*neg_offset);
    }
}