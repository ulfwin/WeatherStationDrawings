
cup_radius=12.5;
arm_length=50;
arm_width=6;
center_radius=18;
center_height=10;

module arm(radius,armlength,armwidth) {
	translate([0,armlength,radius])
	intersection() {
		difference() {
			union() {
				translate([armwidth/2,0,-radius]) rotate([90,0,0]) cylinder(h=armlength,r=armwidth/2);
				sphere(r=radius);
				translate([0,0,-radius]) cylinder(h=radius,r=armwidth*1.2,center=true);
			}
			sphere(r=radius-1);
		}
		translate([radius/2+1,-(armlength-radius)/2+1,0.5]) cube(size=[radius+2,radius+armlength+2,2*radius+1], center=true);
	}
}

difference() {
	union() {
		for (i = [0 : 2]) {
			rotate([0,0,120*i]) arm(cup_radius,arm_length,arm_width);
		}
		cylinder(h=center_height, r=center_radius);
	}
}
