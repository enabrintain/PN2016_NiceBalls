$fn=180;

scale = 78/60;
ballX = 46*scale;
ballY = 60*scale;
ballZ = 51*scale;

module ball(){
    scale([ballX, ballY, ballZ]) sphere(r=.5);
}

module bag(){
    hull()
    {
        translate([-ballX/2,0,0])ball();
        translate([0,0,ballZ/4])cylinder(d=ballX/scale, h=ballX);
    }
    hull()
    {
        translate([ballX/2,0,0])ball();
        translate([0,0,ballZ/4])cylinder(d=ballX/scale, h=ballX);
    }
    translate([0,0,ballZ])cylinder(d=ballX/scale, h=ballX/scale);
}

module mold()
{
    difference()
    {
        translate([-(ballX+2), -(ballY/2+2), -(ballZ/2+2)])cube([ballX*2+4, ballY/2+2, ballZ+ballX+2]);
        //translate([0,0,ballZ/2])cylinder(d=ballX/scale, h=ballX/scale);
        import("ballsack2_subdivided.stl", convexity=3);
    }
}

mold();

