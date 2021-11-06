linkage_height = 36;     //
dia_sm = 7;              // inner diameter
dia_lg = 9;              // 
bolt_offset = 5;
bolt_dia = 3.5;
thickness = 3;

neg_offset = 1;
$fn=60;

difference() {
    union() {
        cylinder(h=linkage_height, d=dia_lg+2*thickness);
    }
    union() {
        translate([0,0,-neg_offset])
            cylinder(h=linkage_height/3+2, d=dia_sm);
        translate([0,0,linkage_height/3])
            cylinder(h=2*linkage_height/3+1, d=dia_lg);
        
        translate([0, 0, bolt_offset]) rotate([90, 0, 0])
            cylinder(h=dia_lg+2*thickness+1, d=bolt_dia);
        for (i=[0:2])
            translate([0, 0, linkage_height-bolt_offset]) rotate([90, 0, 120*i])
                cylinder(h=dia_lg+2*thickness+1, d=bolt_dia);
        
    }
}