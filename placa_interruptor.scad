// Daniel Seijas Iglesias <seijasdeveloper@gmail.com>
// placa interruptor

use <write/Write.scad>

$fn = 100;

largo = 70;
ancho = 35;
grosor = 2.5;

in_diametro = 6;
extra_diametro = 1.5;

in_ancho = 6.6;
in_largo = 12.4+0.5;

difference(){
    union(){
        // base
        cube([largo, ancho, grosor]);
        
        // soporte interrutor
        translate([largo/3-in_ancho/2, ancho/2-(in_largo+grosor*2)/2, grosor])
            cube([in_ancho, in_largo+grosor*2, grosor*1.75]);
        
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
    
    // resta interruptor
    translate([largo/3, ancho/2, -0.05])
        cylinder(d=in_diametro+extra_diametro, h=grosor+0.1);
    
    // resta hueco interruptor
    translate([largo/3-in_ancho/2-0.05, ancho/2-in_largo/2-0.05, grosor-0.01])
            cube([in_ancho+0.1, in_largo+0.1, grosor*1.75+0.1]);
    
    translate([largo/3*1.75-2.5, ancho/2*1.10, 0.4])
        rotate([0, 180, 0])
            write("on");
            *text(text = "on", size = 5);
    
    translate([largo/3*1.75, ancho/2*0.7, 0.4])
        rotate([0, 180, 0])
            write("off");
            *text(text = "off", size = 5);
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
