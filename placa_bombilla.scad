// Daniel Seijas Iglesias <seijasdeveloper@gmail.com>
// placa bombilla

$fn = 100;

largo = 70;
ancho = 35;
grosor = 2.5;

d_min = 10.4;
d_max = 17.6;
diametro_tornillo = 3.65;


difference(){
    union(){
        // base
        cube([largo, ancho, grosor]);
        
        
        // pincho a1
        translate([0, 0, grosor])
            pincho();
        
        // pincho a2
        translate([largo-ancho/2, 0, grosor])
            pincho();
        
        // pincho b1
        translate([0, ancho-grosor/2, grosor])
            pincho();
        
        // pincho b2
        translate([largo-ancho/2, ancho-grosor/2, grosor])
            pincho();
    }
    
    // resta tornillo 1
    translate([largo/2-d_min/2-diametro_tornillo/2, ancho/2, -0.05])
        cylinder(d=diametro_tornillo, h=grosor+0.1);
    
    // resta tornillo 2
    translate([largo/2+d_min/2+diametro_tornillo/2, ancho/2, -0.05])
        cylinder(d=diametro_tornillo, h=grosor+0.1);
    
}

module pincho(){
    difference(){
        cube([ancho/2, grosor/2, ancho]);
        
        
        translate([0, grosor/2+0.05, 0])
            rotate([0, -15, 180])
                cube([ancho/2, grosor/2+0.1, ancho+5]);
        
        translate([ancho/2, -0.05, 0])
            rotate([0, 0, 180])
            rotate([0, -15, 180])
                cube([ancho/2, grosor/2+0.1, ancho+5]);
    }
}
