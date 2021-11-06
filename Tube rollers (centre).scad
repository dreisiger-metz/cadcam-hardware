// also need a variant that takes the hex-head of a bolt instead of a bearing

radius_base            = 12;
radius_smallest        = 4;
radius_largest         = 10;
half_height            = 10;

bearing_height         = 5.6;
bearing_outer_diameter = 15.2;
bearing_hole_diameter  = 8.8;

include_top_bearing    = true;

epsilon                = 0.1;

$fn = 120;

difference() {
    union() {
        cylinder(h=half_height, r1=radius_base + radius_largest, r2=radius_base + radius_smallest);
        translate([0,0,half_height])
            cylinder(h=half_height, r1=radius_base + radius_smallest, r2=radius_base + radius_largest);
    }
    union() {
        // overriding $fn creates a polygon that is inscribed within the circle with
        // all sides (and angles) equal.
        translate([0,0,2*half_height-bearing_height+epsilon]) cylinder(h=bearing_height + epsilon, d=bearing_outer_diameter, $fn=6);
        translate([0,0,-epsilon]) cylinder(h=2*(half_height+epsilon), d=bearing_hole_diameter);
         if (include_top_bearing)
            translate([0,0,-epsilon]) cylinder(h=bearing_height + epsilon, d=bearing_outer_diameter);
   }
}