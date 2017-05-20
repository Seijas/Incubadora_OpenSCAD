// Daniel Seijas Iglesias <seijasdeveloper@gmail.com>
// ruedas incubadora

$fn = 100;

radio = 18;
eje = 5;
grosor = 5;
extra_grosor = 3;

n_radios = 8;

// eje
difference(){
    cylinder(r=eje+extra_grosor, h=grosor);
    
    translate([0, 0, -0.05])
        cylinder(r=eje, h=grosor+0.1);
}

// cubierta
difference(){
    cylinder(r=radio, h=grosor);
    
    translate([0, 0, -0.05])
        cylinder(r=radio-extra_grosor, h=grosor+0.1);
}

// radios
for(i = [1:n_radios]){
    rotate([0, 0, 360/n_radios*i])
    translate([eje+extra_grosor/2, -1, 0])
        cube([radio-eje-extra_grosor, 2, 3]);
}
