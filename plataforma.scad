// Daniel Seijas Iglesias <seijasdeveloper@gmail.com>
// Pataforma

$fn = 50;

largo = 180;
alto = 30;
grosor = 3;
coeficiente_altura = 10;

h_largo = 4;

r_rueda = 3;

difference(){
    union(){
        
        // Exterior
        difference(){
            cube([largo, largo, alto]);
            
            translate([grosor, grosor, -0.05])
                cube([largo-grosor*2, largo-grosor*2, alto+0.1]);
        }
        
        // longitudinales
        for(i = [1:2]){
            translate([0, (largo-grosor)/3*i, 0])
                difference(){
                    cube([largo, grosor, alto-coeficiente_altura]);
                    
                    for(j = [1:24]){
                        translate([(h_largo+grosor)*j, -0.05, grosor])
                            cube([h_largo, grosor+0.1, alto-coeficiente_altura-grosor*2]);
                    }
                }
        }
    }
    
    // hueco motor a1
    translate([-0.05, largo/6, alto/2])
        rotate([0, 90, 0])
            cylinder(r=r_rueda, h=grosor+0.1);
    
    // hueco motor a2
    translate([-0.05, largo/6*5, alto/2])
        rotate([0, 90, 0])
            cylinder(r=r_rueda, h=grosor+0.1);
    
    // hueco motor b1
    translate([largo-grosor-0.05, largo/6, alto/2])
        rotate([0, 90, 0])
            cylinder(r=r_rueda, h=grosor+0.1);
    
    // hueco motor b2
    translate([largo-grosor-0.05, largo/6*5, alto/2])
        rotate([0, 90, 0])
            cylinder(r=r_rueda, h=grosor+0.1);
}