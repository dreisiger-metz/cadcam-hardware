// The final file --- set [include_bolt_head] to true for the centre roller, or false
// for the outer ones

radius_base            = 12;
radius_smallest        = 4;
radius_largest         = 10;
half_height            = 10;

bolt_head_height       = 5.6;
bolt_head_diameter     = 16.2;

bearing_height         = 7;
bearing_outer_diameter = 22.5;
bearing_hole_diameter  = 8.8;


include_bolt_head      = true;

epsilon                = 0.1;

$fn = 120;

difference() {
    union() {
        cylinder(h=half_height, r1=radius_base + radius_largest, r2=radius_base + radius_smallest);
        translate([0,0,half_height])
            cylinder(h=half_height, r1=radius_base + radius_smallest, r2=radius_base + radius_largest);
    }
    union() {
        translate([0,0,-epsilon]) cylinder(h=2*(half_height+epsilon), d=bearing_hole_diameter);
        translate([0,0,-epsilon]) cylinder(h=bearing_height + epsilon, d=bearing_outer_diameter);
        if (include_bolt_head)
            translate([0,0,2*half_height-bolt_head_height+epsilon])
              cylinder(h=bolt_head_height + epsilon, d=bolt_head_diameter, $fn=6);
    }
}