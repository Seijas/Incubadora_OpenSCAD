// Daniel Seijas Iglesias <seijasdeveloper@gmail.com>
// huevera

$fn = 100;

numero_huevos = 4;
numero_clavos = 3;

grosor = 5;
radio_huevo = 46/2-0.5; // 46 diametro de huevo, 3 coeficiente

d_soporte_delantero = grosor+grosor*2;
d_soporte_trasero = grosor+grosor*2;

diametro_clavo = 2.5+0.5;
extra_altura = 30;

*marca_impre([-radio_huevo-grosor-20, -radio_huevo-grosor, 0]);


union(){
    
    // cilindros
    difference(){
        union(){
            
            // Soporte delantero
            difference(){
                union(){
                    // cilindro inferior
                    translate([-d_soporte_delantero, 0, 0])
                        cylinder(r=radio_huevo+grosor, h=grosor);
                    
                    // cono superior
                    translate([-d_soporte_delantero, 0, grosor])
                        cylinder(r1=radio_huevo+grosor, r2=radio_huevo+grosor/1.5, h=grosor);
                    
                    // extra altura
                    translate([-d_soporte_delantero, 0, grosor+grosor])
                        cylinder(r=radio_huevo+grosor/1.5, h=extra_altura);
                    
                    // Refuerzo exterior soporte delantero
                    translate([-d_soporte_delantero, radio_huevo, 0])
                        cube([d_soporte_delantero, grosor, grosor]);
                    // Refuerzo exterior soporte delantero
                    translate([-d_soporte_delantero, -radio_huevo-grosor, 0])
                        cube([d_soporte_delantero, grosor, grosor]);
                }
                
                // resta cilindro inferior
                translate([-grosor-grosor*2, 0, -0.05])
                    cylinder(r=radio_huevo, h=grosor*2+0.1);
                
                // resta cono superior
                translate([-d_soporte_delantero/2, 0, grosor-0.01])
                   cylinder(r2=radio_huevo+grosor*1.5, r1=radio_huevo+grosor*1.15, h=grosor+0.05);
                
                // resta extra altura
                translate([-d_soporte_delantero/2, 0, grosor+grosor-0.05])
                    scale([1, 1.25, 1])
                        cylinder(r1=radio_huevo+grosor*1.5, r2=radio_huevo+grosor*1.75, h=extra_altura+0.1);
                
                // Hueco clavo
                translate([-d_soporte_delantero-radio_huevo-grosor-0.05, 0, grosor+diametro_clavo/2])
                    rotate([0, 90, 0])
                        cylinder(d=diametro_clavo, h=grosor+0.1);
                
                // Hueco clavo altura
                for(i = [1:numero_clavos]){
                    translate([-d_soporte_delantero-radio_huevo-grosor-0.05, 0, grosor+diametro_clavo/2+(extra_altura/numero_clavos*i)])
                        rotate([0, 90, 0])
                            cylinder(d=diametro_clavo, h=grosor+0.1);
                }
            }
            
            // Cilindro para huevo
            for( i = [0:numero_huevos-1]){
                translate([(radio_huevo+grosor)*2*i, 0, 0])
                    cylinder(r=radio_huevo+grosor, h=grosor);
            }
            
            // Refuerzo
            for( i = [0:numero_huevos-2]){
                translate([(radio_huevo+grosor)*2*i+radio_huevo+grosor, 0, 0])
                    cylinder(r=radio_huevo/2, h=grosor);
            }
            
            // Soporte trasero
            difference(){
                union(){
                    // cilindro inferior  ********************************************************************************+
                    translate([(radio_huevo+grosor)*2*(numero_huevos-1)+d_soporte_trasero, 0, 0]) 
                        cylinder(r=radio_huevo+grosor, h=grosor);
                    
                    // cono superior
                    translate([(radio_huevo+grosor)*2*(numero_huevos-1)+d_soporte_trasero, 0, grosor])
                        cylinder(r1=radio_huevo+grosor, r2=radio_huevo+grosor/2, h=grosor);
                    
                    // Refuerzo exterior soporte trasero
                    translate([(radio_huevo+grosor)*2*(numero_huevos-1), radio_huevo, 0])
                        cube([d_soporte_delantero, grosor, grosor]);
                    // Refuerzo exterior soporte trasero
                    translate([(radio_huevo+grosor)*2*(numero_huevos-1), -radio_huevo-grosor, 0])
                        cube([d_soporte_delantero, grosor, grosor]);
                }
                
                // resta cilindro inferior
                translate([(radio_huevo+grosor)*2*(numero_huevos-1)+d_soporte_trasero, 0, -0.05])
                    cylinder(r=radio_huevo, h=grosor*2+0.1);
                
                // resta cono superior
                translate([(radio_huevo+grosor)*2*(numero_huevos-1)+d_soporte_trasero/2, 0, grosor-0.01])
                   cylinder(r2=radio_huevo+grosor*1.5, r1=radio_huevo+grosor*1.15, h=grosor+0.02);
                
                // Hueco clavo
                translate([(radio_huevo+grosor)*2*(numero_huevos-1)+d_soporte_trasero+radio_huevo-0.05, 0, grosor+diametro_clavo/2])
                    rotate([0, 90, 0])
                        cylinder(d=diametro_clavo, h=grosor+0.1);
            }
        }
        
        // resta para el huevo
        for( i = [0:numero_huevos-1]){
            translate([(radio_huevo+grosor)*2*i, 0, -0.05])
                cylinder(r=radio_huevo, h=grosor+0.1);
        }
    }
    
    // Refuerzo exterior superior
    translate([0, radio_huevo, 0])
        cube([(radio_huevo+grosor)*2*(numero_huevos-1), grosor, grosor]);
    // Refuerzo exterior inferior
    translate([0, -radio_huevo-grosor, 0])
        cube([(radio_huevo+grosor)*2*(numero_huevos-1), grosor, grosor]);
    
    
}


module marca_impre(pos){
    translate(pos)
        difference(){
            cube([190, 190, grosor]);
            
            translate([grosor, grosor, -0.05])
                cube([190-grosor*2, 190-grosor*2, grosor+0.1]);
        }
}