int fidu;

void  updateTuioObject (TuioObject objetoTuio) {
fidu = objetoTuio.getSymbolID();

  
if (fidu == 0 && amano == 0){
   bmano = objetoTuio.getY()*height;
}
}

void addTuioObject (TuioObject objetoTuio1){
  fidu = objetoTuio1.getSymbolID();
if (fidu == 1){  
  
      alpha = 0;
    //para que la mano desaparezca y vuelva
  amano = amano -400;
 constrain (amano, 0, -800);
//rata
cuerpo = new FBox (40, 45);
cuerpo.setName ("cuerpo");
 cuerpo.setPosition (360, mouseY);

if (bmano>400 && bmano<700) {//más bajo
   cuerpo.setVelocity(0, 100);
 cuerpo.setRestitution(0.2);
 cuerpo.setDensity(500); //peso del cuerpo
 } else if (bmano>200 && bmano<400) {//medio
   cuerpo.setVelocity(0, 300);
 cuerpo.setRestitution(0.5);
    cuerpo.setDensity(2000);
  } else if (bmano>0 && bmano<200) {//mas alto
  cuerpo.setVelocity(0, 500);
  cuerpo.setRestitution(0.8);
   cuerpo.setDensity(3500);
 }
 cuerpo.attachImage(rata1);
 mundo.add(cuerpo);
}

}
