// Daniel Seijas Iglesias <seijasdeveloper@gmail.com>
// palanca motor

$fn = 100;

eje_largo = 6.3;
eje_ancho = 3.5;
eje_diametro = 5.5;

grosor = 6;
largo = 60;

extra_motor = 2;

difference(){
    union(){
        // palo
        translate([(eje_diametro+grosor)/2-grosor/2, (eje_diametro+grosor)/2-grosor/2, 0])
            cube([largo, grosor, grosor]);
        
        translate([(eje_diametro+grosor)/2, (eje_diametro+grosor)/2, 0])
            cylinder(d=eje_diametro+grosor, h=grosor);
        
        translate([largo+(eje_diametro+grosor)/2-grosor/2, (eje_diametro+grosor)/2, 0])
            cylinder(d=grosor, h=grosor*3);
    }
    
    translate([(eje_diametro+grosor)/2, (eje_diametro+grosor)/2, -0.05])
        difference(){
            // eje
            cylinder(d=eje_diametro, h=eje_largo);
            
            // resta positiva
            translate([-eje_diametro/2, eje_ancho/2, -0.05])
                cube([eje_diametro, eje_diametro, eje_largo+0.1]);
            
            // resta negativa
            translate([-eje_diametro/2, -eje_diametro-eje_ancho/2, -0.05])
                cube([eje_diametro, eje_diametro, eje_largo+0.1]);
        }
}
