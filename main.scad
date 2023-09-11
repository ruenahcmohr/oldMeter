
 outline = "main.dxf";
 
//Guage2-test.stl  is the other required file

/*

You need the following parts:

face();
// window, cnc
adapterFlange();
// sewing pin
PinSupport();
needleAdapter();
needle(); // cnc it...
backface();
pulley();
pulley2();
// thread for pullies
// spring for thread tension
// SG90 servo
motorFrame();
tube();
backcap();

9x 1.75mm PLA-filament pins
2x servo mounting screws (came with the servo)
1x servo horn screw (came with the servo)
2x backface mounting screws
2x pin support mounting screws


------------------
   prints
   
v face();
v adapterFlange();
v PinSupport();
v needleAdapter();
v backface();
v pulley();
v pulley2();
v motorFrame();
v tube();
v backcap();



*/

 L0 = 2; 
 L1 = 1.2; 
 L2 = 20;
 L3 = 4; // 1.5
 L4 = 25;
 
 L5 = 5;
 L6 = 9.5;
 L7 = 5;
 
 L10 = 1;
 L11 = 1.8;
 L12 = 2;
 
 Lneedle = 1;
 
 L20 = 1;
 L21 = 2;
 L22 = 6;
 
 LC1 = 5;
 LC2 = 17-8+4.5;
 
 L30 = 1;
 L31 = 8;
 
 L40 = 43;
 
 L50 = 1;
 
 L60 = 1.5;
 
 L70 = 1;
 L71 = 5;
 
 L80=1;
 L81=4;
 
 L90 = 7.5;
 L91 = 6;
 L92 = 0.5;
 L93 = 10;
 
L100 = 2;

// PinSupport();
// motorFrame();

// ** tube();

//backcap();
 
 module assembly() {
     
 color("#555555")
 face();
 
 color("#00ff00")
 translate([0,0,4])
 adapterFlange();
 
 translate([0,0,-8]) {
 
 color("#0000FF")
  translate([0,0,13])
 PinSupport();
 
 translate([0,0,14.5])
needleAdapter();

color("#ff0000")
translate([0,0,14.5])  
needle(); // cnc it...
     
color([1,1,1])
translate([0,0,17])  
//backface();
 backfaceB();

color("#aa00FF")
translate([0,11.808,19])  
pulley();

color("#557700")
translate([0,0,23]) 
rotate([0,180,0])
pulley2();

translate([0,0,31]) 
color("#0000ff")
potBracket();

translate([0,0,31]) 
rotate([0,180,0])
motorFrame();

color("#8888ff")
 translate([0,0,37+20]) 
 rotate([0,180,0])
 backcap();
 
 color ("#aa00ff")
  translate([0,0,13.1]) 
 trimLock();
 
 }
 }
 
 //translate([0,0,-5]) 
 //assembly();
 
 //color("#aa00ff")
 //tube();
 
  module assemblyHoles() {
     
 translate([0,0,-1])
 adapterFlangeHoles();

translate([0,0,18]) 
rotate([0,180,0])
motorFrameHoles();

 translate([0,0,44]) 
 rotate([0,180,0])
 backcapHoles();
 
 }
 
 //assemblyHoles();
 
 
 module face() {

     difference() {
         
     union() {
     import(file="Guage2-test.stl");
     
     translate([0,-0,3])
     linear_extrude(height=L1, convexity=5) {
       import(file=outline, layer="1", $fn=288);
     }
 }
 
 // trim hole
  //  translate([0, -20.6375, 6.2-2.4])
 //cylinder(h = 4, d=7.6, $fn=100, center=true);
  translate([0, -20.6375, 0.2])
      rotate_extrude( convexity=5, $fn=248) {
       import(file=outline, layer="R6", $fn=248);
     } 
 
 // all the holes
  translate([0, 0, -1])
      linear_extrude(height=L2, convexity=5) {
       import(file=outline, layer="2", $fn=188);
     }
 

     }

 }
 
 //face();
 /*
 color("#ff0000")
translate([0,0,-4.2])
 face();
 */
 /*
  color("#0000ff")
tube();
 */
 // color("#00ff00")
 // adapterFlange();   
 
 
 
module adapterFlangeHoles() {
    
      rotate([0,0,30+240])
      translate([0,-10,L31/2+L30])
      rotate([90,0,0])
      cylinder(20, d=1.75+.45, $fn=70);
     
      rotate([0,0,30+120])
      translate([0,-10,L31/2+L30])
      rotate([90,0,0])
      cylinder(20, d=1.75+.45, $fn=70);
     
      rotate([0,0,30])
      translate([0,-10,L31/2+L30])
      rotate([90,0,0])
      cylinder(20, d=1.75+.45, $fn=70);  
    
}


module adapterFlange() {
    difference() {
    union() {
     linear_extrude(height=L30, convexity=5) {
       import(file=outline, layer="30", $fn=288);
     }
     translate([0,0,L30])
     linear_extrude(height=L31, convexity=5) {
       import(file=outline, layer="31", $fn=288);
     }
    }
    
    adapterFlangeHoles();
    
}
 }
adapterFlange();
 
 
 module motorFrameHoles() {
     
      AO = -30;
  rotate([0,0,AO+240])
  translate([0,-10,L90/2])
  rotate([90,0,0])
  cylinder(20, d=1.75+.45, $fn=70);
 
  rotate([0,0,AO+120])
  translate([0,-10,L90/2])
  rotate([90,0,0])
  cylinder(20, d=1.75+.45, $fn=70);
 
  rotate([0,0, AO])
  translate([0,-10,L90/2])
  rotate([90,0,0])
  cylinder(20, d=1.75+.45, $fn=70);
     
 }
 
 
module potBracket() {  
 linear_extrude(height=L10, convexity=5) {
       import(file=outline, layer="10", $fn=288);
   }
   translate([0,0,L10])
  linear_extrude(height=L11, convexity=5) {
       import(file=outline, layer="11", $fn=288);
   }
 translate([0,0,L10+L11])
  linear_extrude(height=L12, convexity=5) {
       import(file=outline, layer="12", $fn=288);
   }
   
 }
 //potBracket();
 
 
 module motorFrame() {
     difference() {
    union() {
   linear_extrude(height=L90, convexity=5) {
       import(file=outline, layer="90", $fn=288);
   }
   translate([0,0,L90])
  linear_extrude(height=L91, convexity=5) {
       import(file=outline, layer="91", $fn=288);
     } 
     
     translate([0,0,L90])
  linear_extrude(height=L92, convexity=5) {
       import(file=outline, layer="92", $fn=288);
     }    
     
  translate([0,0,L90])
  linear_extrude(height=L93, convexity=5) {
       import(file=outline, layer="93", $fn=288);
     }    
 }
  motorFrameHoles();
 }
 }
 
 //motorFrame();
 
 
 module backcapHoles() {
     
          AO = -30;
      rotate([0,0,AO+240])
      translate([0,-10,L71/2+L70])
      rotate([90,0,0])
      cylinder(20, d=1.75+.45, $fn=70);
     
      rotate([0,0,AO+120])
      translate([0,-10,L71/2+L70])
      rotate([90,0,0])
      cylinder(20, d=1.75+.45, $fn=70);
     
      rotate([0,0,AO])
      translate([0,-10,L71/2+L70])
      rotate([90,0,0])
      cylinder(20, d=1.75+.45, $fn=70);  
 }
 
 module backcap() {
     difference() {
     union() {
       linear_extrude(height=L70, convexity=5) {
           import(file=outline, layer="70", $fn=288);
         }   
         translate([0,0,L70])
        linear_extrude(height=L71, convexity=5) {
           import(file=outline, layer="71", $fn=288);
         } 
     }
     
     backcapHoles();
     
     }
 }
 // backcap();
 
 module PinSupport() {
       linear_extrude(height=L50, convexity=5) {
       import(file=outline, layer="50", $fn=288);
     }
 }
 //PinSupport();
 
 module trimLock() {
       linear_extrude(height=L100, convexity=5) {
       import(file=outline, layer="100", $fn=288);
     }
 }
 
 //trimLock();

 module backface() {
      linear_extrude(height=L20, convexity=5) {
       import(file=outline, layer="20", $fn=288);
     }

 }
 
 //translate([0,0,12])
 //backface();
 
  module backfaceB() { // the steam-punk version
      linear_extrude(height=L20, convexity=5) {
       import(file=outline, layer="20B", $fn=288);
     }

 } 
 //backfaceB();
 
 module tube() {
   difference() {  
   linear_extrude(height=L40, convexity=5) {
       import(file=outline, layer="40", $fn=288);
   }  
   
   assemblyHoles();
   }
 }
 
//tube();


 
 // cnc this...   
 module needle() {
      linear_extrude(height=Lneedle, convexity=5) {
       import(file=outline, layer="needle", $fn=288);
     }
 }
 
 module needleAdapter() {
       linear_extrude(height=L60, convexity=5) {
       import(file=outline, layer="60", $fn=288);
     }
 }
 
 module pulley() {
   difference() {  
  rotate_extrude( convexity=5, $fn=190) {
       import(file=outline, layer="300", $fn=190);
     }
   translate([0,0, -5])
   linear_extrude(height=10, convexity=5) {
       import(file=outline, layer="301", $fn=288);
     }    
 }
 }
        
 //pulley();
 
 module pulley2() {
      linear_extrude(height=L80, convexity=5) {
       import(file=outline, layer="80", $fn=288);
     }  
        linear_extrude(height=L81, convexity=5) {
       import(file=outline, layer="81", $fn=288);
     }     
     
 }
 //pulley2();
 
/* Copy-pasta pile:
 
   translate([0,-0.005,50])
      rotate_extrude( convexity=5, $fn=248) {
       import(file=outline, layer="10", $fn=248);
     } 


     //2x dovetail
     translate([0,0,0])
     rotate([0,0,0])    
     linear_extrude(height=L20, convexity=5) {
       import(file=outline, layer="20", $fn=188);
     }
 } // end of the union
 
     
     // 3x bolt
     color([1,0,0])
  translate([0,-0.005,50])
  rotate([-90,0,0]) {
     linear_extrude(height=L30, convexity=5) {
       import(file=outline, layer="30", $fn=188);
     }
     
     translate([0,0,L30-0.006])
     linear_extrude(height=L31, convexity=5) {
       import(file=outline, layer="31", $fn=188);
     }
 }
 
  // 4x side bolt
 color([0, 1, 0])
      translate([0,0,57.005])
      linear_extrude(height=L40, convexity=5) {
       import(file=outline, layer="40", $fn=188);
     }
 
     




  translate([0,0,L0+L1])
     linear_extrude(height=L2, convexity=5) {
       import(file=outline, layer="2", $fn=188);
     }




     translate([10, -0, 25/2])
     rotate([0,90,0])
     cylinder(h = 40, r =2.0, $fn=100, center=true);

}
*/
