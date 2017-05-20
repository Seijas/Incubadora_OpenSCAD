// Daniel Seijas Iglesias  <seijasdeveloper@gmail.com>

$fn = 100;

macho = true;

//variables base
grosor = 4;
largo  = 170;
ancho  = 120-50;
altura = 65;

ancho_ruedas = 30;

radio_circulo = 15;
diferencia = 10;

difference(){
    union(){
        // Largo
        cube([largo, grosor, altura]);
        
        // lado derecho
        cube([grosor, ancho, altura]);
        
        // lado izquierdo
        *translate([largo, 0, 0])
        cube([grosor, ancho, altura]);
        
        // base ruedas
        cube([largo, ancho_ruedas, grosor]);
        
        if(macho){
        translate([largo+diferencia, 0, altura/2])
        rotate([-90, 0, 0])
            cylinder(r=radio_circulo-0.2, h=grosor);
        }
    }
    
    if(!macho){
    translate([largo-diferencia, -0.05, altura/2])
        rotate([-90, 0, 0])
            cylinder(r=radio_circulo, h=grosor+0.1);
    }
}