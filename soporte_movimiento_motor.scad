// Daniel Seijas Iglesias <seijasdeveloper@gmail.com>
// soporte movimiento motor

$fn = 100;

s_grosor = 6;
s_largo = 60;

s_extra_motor = 2;

extra_grosor = 1;

largo = 180;
ancho = (s_grosor+extra_grosor)*2.75;
grosor = 3;

difference(){
    // Base con esquinas redondeadas
    union(){
        translate([ancho, 0, 0])
            cube([largo-ancho*2, ancho, grosor]);
        
        translate([ancho, 0, 0])
            cylinder(r=ancho, h=grosor);
        
        translate([largo-ancho, 0, 0])
            cylinder(r=ancho, h=grosor);
    }
    
    // resta circunferencias
    translate([0, -ancho, -0.05])
        cube([largo, ancho, grosor+0.1]);
    
    // resta centro
    translate([(largo-s_largo*2.5)/2, ancho/2, -0.05])
        hull(){
            cylinder(d=s_grosor+extra_grosor, grosor+0.1);
            
            translate([s_largo*2.5, 0, 0])
                cylinder(d=s_grosor+extra_grosor, grosor+0.1);
        }
}
// suma extra
translate([0, -grosor, 0])
    cube([largo, grosor, grosor]);

