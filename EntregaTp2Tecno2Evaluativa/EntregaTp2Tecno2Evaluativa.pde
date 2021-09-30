import TUIO.*;
TuioProcessing tuio;

import processing.sound.*;
SoundFile musica;
SoundFile splash;
SoundFile hit;

import fisica.*;
FWorld mundo;

FBox suelo;

FBox cuerpo;

FBox catapulta; //rectangulo largo de la catapulta
FBox eje; //eje de la catapulta
FDistanceJoint cadena; // cadena de la catapulta
float cx;
float cy;


float iyanterior;
float ingr;
FCircle ingrediente1; //objetos para tirar
float ix; // posicion de los ingredientes en la catapulta cuando estan listos para tirar
float iy;
FCircle ingrediente2;
float ix2;
float iy2;
FCircle ingrediente3;
float ix3;
float iy3;
FCircle ingrediente4;
float ix4;
float iy4;
FCircle ingrediente5;
float ix5;
float iy5;

float sombraposicionx;
float sombraposiciony;
float sombratamanox;
float sombratamanoy;
float sombramapx;
float sombramapy;

 float ox = width / 2;
 float oy = height - 100;

FBox lado1olla;
FBox lado2olla;
FBox abajoolla;

FPoly contenedor;

FBox ratita;
FBox mano;
float amano = 0;
float bmano;

int alpha = 255;

//Funciones del contador
int puntos;
int puntosSumar =  +1;
//ganar o perder
boolean ganaste;
boolean perdiste;

//imagenes
PImage cata;
PImage cacerola;
PImage corcho;
PImage brocoli;
PImage champinion;
PImage cebolla;
PImage cebolla2;
PImage fondo;
PImage brazo;
PImage morron;
PImage rata;
PImage rata1;
PImage pantallaganaste;
PImage pantallaperdiste;

//posiciones imagenes ingredientes
int posi1 = 50;
int posi2 = 70;
int posi3 = 60;
int posi4 = 65;

int marcadetiempo;
int estado = 0;
int cuenta;

void setup() {
  size(1300, 700);
  
  tuio = new TuioProcessing (this);
  
   musica = new SoundFile (this, "Le Festin.wav");
    musica.amp(0.3);
    musica.loop();
    
    splash = new SoundFile (this, "Splash.wav");
    
    hit = new SoundFile (this, "Hit.wav");
    hit.amp (0.3);

  Fisica.init(this);
  
      //imagenes
  rata = loadImage ("rata1.png");
  rata.resize (80, 85);
  rata1 = loadImage ("rata2.png");
  rata1.resize (150, 155);
  cata = loadImage ("cuachara.png");
  cata.resize (350, 350);
  cacerola = loadImage ("olla.png");
  cacerola.resize (310, 220);
  corcho = loadImage ("corcho.png");
  corcho.resize (70, 70);
  brocoli = loadImage ("brocoli.png");
  brocoli.resize (50, 50);
  cebolla = loadImage ("cebolla.png");
  cebolla.resize (40 ,40);
  cebolla2 = loadImage ("cebolla.png");
  cebolla2.resize (55, 55);
  champinion = loadImage ("champinion.png");
  champinion.resize (20, 20);
  fondo = loadImage ("fondis.png");
  fondo.resize (width, height);
  brazo = loadImage ("mano.png");
  brazo.resize (800,150);
  morron = loadImage ("morron.png");
  morron.resize (30,  30);
  pantallaganaste = loadImage ("pantalla_ganar.png");
  pantallaperdiste = loadImage ("pantalla_perder.png");

  mundo = new FWorld();
  mundo.setEdges(); //la caja donde va a funcionar la física
  mundo.remove(mundo.top);  

  suelo = new FBox ( width, 2);
  suelo.setName ("suelo");
  suelo.setPosition ( width/2, height-7);
  suelo.setStaticBody (true);
  mundo.add (suelo);

  cx = 224;
  cy = 540;
  //catapulta
  catapulta = new FBox (300, 20);
  catapulta.setPosition (cx, cy);
  catapulta.setName("catapulta");
    catapulta.attachImage (cata);
  mundo.add(catapulta);

  eje = new FBox (50, 50);
  eje.setPosition (cx, cy+80);
  eje.setNoFill();
  eje.setNoStroke();
  eje.setStaticBody (true);
  mundo.add(eje);

  cadena = new FDistanceJoint( eje, catapulta);
  cadena.setLength (25);
    cadena.setNoStroke();
  cadena.setNoFill ();
  mundo.add(cadena);

  //posiciones iniciales de los ingredientes
  ix = 137;
  iy = height/2;
  ix2 = -680;
  iy2 = 300;
  ix3 = -680;
  iy3 = 250;
  ix4 = -680;
  iy4 = 350;
  ix5 = -680;
  iy5 = 150;

  //ingredientes
  ingrediente1 = new FCircle (40);
  ingrediente1.setName ("ingrediente1");
  ingrediente1.setPosition (ix, iy);
  ingrediente1.setDensity (12);
  ingrediente1.setRestitution(0.4);
  ingrediente1.attachImage (brocoli);
  mundo.add(ingrediente1);

  ingrediente2 = new FCircle (50);
  ingrediente2.setName ("ingrediente2");
    ingrediente2.setPosition (ix2, iy2);
  //ingrediente2.setPosition (30, 616);
  ingrediente2.setDensity (25);
  ingrediente2.setRestitution(0.4);
    ingrediente2.attachImage (cebolla2);
  mundo.add(ingrediente2);

  ingrediente3 = new FCircle (20);
  ingrediente3.setName ("ingrediente3");
  ingrediente3.setPosition (ix3, iy3);
  //  ingrediente3.setPosition (70 , 621);
  ingrediente3.setDensity (9);
  ingrediente3.setRestitution(0.4);
  ingrediente3.attachImage (champinion);
  mundo.add(ingrediente3);
  
    ingrediente4 = new FCircle (40);
  ingrediente4.setName ("ingrediente4");
  ingrediente4.setPosition (ix4, iy4);
  //  ingrediente4.setPosition (60,650);
  ingrediente4.setDensity (9);
  ingrediente4.setRestitution(0.4);
    ingrediente4.attachImage (cebolla);
  mundo.add(ingrediente4);
  
    ingrediente5 = new FCircle (30);
  ingrediente5.setName ("ingrediente5");
  ingrediente5.setPosition (ix5, iy5);
  //  ingrediente5.setPosition (19,655);
  ingrediente5.setDensity (25);
  ingrediente5.setRestitution(0.4);
    ingrediente5.attachImage (morron);
  mundo.add(ingrediente5);
  
  //olla
  lado1olla = new FBox (15, 100);
  lado1olla.setName ("lado 1 olla");
  lado1olla.setPosition (930, 563);
  lado1olla.setStaticBody (true);
  lado1olla.setNoStroke();
  lado1olla.setNoFill ();
  mundo.add(lado1olla);
  
  
  lado2olla = new FBox (15, 100);
   lado2olla.setName ("lado 2 olla");
  lado2olla.setPosition (1180, 563);
  lado2olla.setStaticBody (true);
  lado2olla.setNoStroke();
  lado2olla.setNoFill ();
  mundo.add(lado2olla);
  
    abajoolla = new FBox (250, 15);
   abajoolla.setName ("abajo olla");
  abajoolla.setPosition (1055, 620);
  abajoolla.setStaticBody (true);
  abajoolla.setNoStroke();
  abajoolla.setNoFill ();
  mundo.add(abajoolla);
  

  //rampa y puertita
  contenedor = new FPoly ();
  contenedor.vertex (-635, 525);
  contenedor.vertex (-720, 525);
  contenedor. vertex (-720, 386);
  contenedor. vertex (-715, 386);
  contenedor. vertex (-715, 504);
  contenedor. vertex (-640, 504);
  contenedor. vertex (-640, 386);
  contenedor.vertex ( -635, 386);
    contenedor.setNoStroke();
  contenedor.setFill (200, 80, 80);
  contenedor.setStaticBody (true);
  mundo.add ( contenedor);
 
 mano = new FBox (800,20);
 mano.setStaticBody (true);
 mano.setSensor (true);
  mano.attachImage (brazo);
 mundo.add(mano);
 
  ratita = new FBox (40,45);
 ratita.setStaticBody (true);
  mano.setSensor (true);
 ratita.attachImage (rata);
 mundo.add (ratita);
}

void draw() { 
background (fondo);

//hud de potencia
pushMatrix ();
noStroke();
fill (237,63,63,alpha); // rojo
rect (15, 46, 25, 350, 28);
fill (169, 219, 132, alpha); // verde
rect (15, 350, 25, 250, 28);
fill (239, 187, 78, alpha); // naranja
rect (15, 200, 25, 200);
fill (255, alpha);
text ("MAX", 7, 40);
text ("MIN", 10, 625);
text ("Siguiente ingrediente", 120, 40);
popMatrix ();

//mano con la ratita
 ratita.setPosition (amano +360, bmano - 40);
 mano.setPosition (amano, bmano);
 
   //imagen del corcho
  image (corcho, 190, 570);
 
  //imagenes de los ingredientes
  pushMatrix();
  tint(255, alpha);
 image (cebolla2, 100, posi1);
 image (champinion, 180, posi2);
 image (cebolla, 235, posi3);
 image (morron, 300, posi4);
 noTint();
 popMatrix();
 
 //sombras
if (ingr == 0){
sombratamanox = ingrediente1.getY();
sombratamanoy = ingrediente1.getY();
sombramapx = map( sombratamanox, -700, height, 15, 50);
sombramapy = map (sombratamanoy, -700, height, 1, 15);

noStroke();
 fill ( 100, 75);
ellipse (ingrediente1.getX(), 670, sombramapx, sombramapy);
}

if (ingr == 1.5){
sombratamanox = ingrediente2.getY();
sombratamanoy = ingrediente2.getY();
sombramapx = map( sombratamanox, -700, height, 25, 60);
sombramapy = map (sombratamanoy, -700, height, 11, 25);

noStroke();
 fill ( 100, 75);
ellipse (ingrediente2.getX(), 670, sombramapx, sombramapy);
}
if (ingr == 2.5){
sombratamanox = ingrediente3.getY();
sombratamanoy = ingrediente3.getY();
sombramapx = map( sombratamanox, -700, height, 5, 25);
sombramapy = map (sombratamanoy, -700, height, 1, 5);

noStroke();
 fill ( 100, 75);
ellipse (ingrediente3.getX(), 670, sombramapx, sombramapy);
}

if (ingr == 3.5){
sombratamanox = ingrediente4.getY();
sombratamanoy = ingrediente4.getY();
sombramapx = map( sombratamanox, -700, height, 15, 50);
sombramapy = map (sombratamanoy, -700, height, 1, 15);

noStroke();
 fill ( 100, 75);
ellipse (ingrediente4.getX(), 670, sombramapx, sombramapy);
}

if (ingr == 4.5){
sombratamanox = ingrediente5.getY();
sombratamanoy = ingrediente5.getY();
sombramapx = map( sombratamanox, -700, height, 15, 50);
sombramapy = map (sombratamanoy, -700, height, 1, 15);

noStroke();
 fill ( 100, 75);
ellipse (ingrediente5.getX(), 670, sombramapx, sombramapy);
}
 

  // contador de puntos - si un ingrediente cae en la olla suma un punto
  fill (255);
  textSize (20);
  text ("Puntos: " + puntos + "/3", 1100, 40);
  

  // Si el ingrediente está dentro de la zona de la olla suma 1 punto, y el siguiente ingrediente se coloca en posición
  if (ingrediente1.getX() > (930) && ingrediente1.getX() < (1180) && ingrediente1.getY() > (500) && ingrediente1.getY() < (610)) {
    puntos = puntos + puntosSumar ;
        splash.play();
    ingr= 1;
    mundo.remove (ingrediente1);
  }
  if (ingrediente2.getX() > (930) && ingrediente2.getX() < (1180) && ingrediente2.getY() > (500) && ingrediente2.getY() < (610)) {
    puntos = puntos + puntosSumar ;
        splash.play();
    ingr= 2;
    mundo.remove (ingrediente2);
  }
  if (ingrediente3.getX() > (930) && ingrediente3.getX() < (1180) && ingrediente3.getY() > (500) && ingrediente3.getY() < (610)) {
    puntos = puntos + puntosSumar ;
        splash.play();
    ingr= 3;
    mundo.remove (ingrediente3);
  }
    if (ingrediente4.getX() > (930) && ingrediente4.getX() < (1180) && ingrediente4.getY() > (500) && ingrediente4.getY() < (610)) {
    puntos = puntos + puntosSumar ;
        splash.play();
    ingr= 4;
    mundo.remove (ingrediente4);
  }
    if (ingrediente5.getX() > (930) && ingrediente5.getX() < (1180) && ingrediente5.getY() > (500) && ingrediente5.getY() < (610)) {
    puntos = puntos + puntosSumar ;
        splash.play();
    ingr= 5;
    mundo.remove (ingrediente5);
  }

  //si el ingrediente se va se pantalla, el siguiente ingrediente aparece en posición
  if (ingrediente1.getX () > width || ingrediente1.getY() < -700) {
    ingr= 1;
    mundo.remove (ingrediente1);
  }
  if (ingrediente2.getX () > width || ingrediente2.getY() < -700) {
    ingr= 2;
    mundo.remove (ingrediente2);
  }
    if (ingrediente3.getX () > width || ingrediente3.getY() < -700) {
    ingr= 3;
    mundo.remove (ingrediente3);
  }
    if (ingrediente4.getX () > width || ingrediente4.getY() < -700) {
    ingr= 4;
    mundo.remove (ingrediente4);
  }
      if (ingrediente5.getX () > width || ingrediente5.getY() < -700) {
    ingr= 5;
    mundo.remove (ingrediente5);
  }

  //permite que los ingredientes cambien de posición sin trabar todo
  if (ingr==1) {
    ingrediente2.setPosition(ix, iy);
    ingr= 1.5;
    amano = 0;
    posi1 = -100;
    alpha = 255;

  }
  if (ingr==2) {
    ingrediente3.setPosition(ix, iy);
    ingr= 2.5;
    amano = 0;
    posi2 = -100;
    alpha = 255;
  }
    if (ingr==3) {
    ingrediente4.setPosition(ix, iy);
    ingr= 3.5;
    amano = 0;
    posi3 = -100;
    alpha = 255;
  }
    if (ingr==4) {
    ingrediente5.setPosition(ix, iy);
    ingr= 4.5;
    amano = 0;
    posi4 = -100;
    alpha = 255;
  }
  
  //ganar o perder + reinicio
  if (ingr==5 && puntos >= 3 && estado == 0) {
    ganaste = true;
    marcadetiempo = millis();
    estado = 1;
  }
   if (ingr==5 && puntos < 3 && estado == 0) {
    perdiste = true;
    marcadetiempo = millis();
    estado = 1;
  }
  
 if ( ganaste && estado == 1 ){
   image (pantallaganaste, 0, 0, width, height);
   text ("Intenta ganar otra vez en " + -(((millis() - marcadetiempo)/1000)-5), 450, 450);
   reinicio();
 } else if ( perdiste && estado == 1 ){
    image (pantallaperdiste, 0, 0, width, height);
    text ("Vuelve a intentar en " + -(((millis() - marcadetiempo)/1000)-5), 480, 450);
     reinicio();
 }
   //imagen de la cacerola
 image (cacerola, 900, 410);
 
 mundo.step();
  mundo.draw();
}
