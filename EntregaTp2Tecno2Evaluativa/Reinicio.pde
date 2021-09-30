void reinicio () {
  if ( (millis() - marcadetiempo) >= 5000){
    
    ingr = 0;
    
    ox = width / 2;
    oy = height - 100;
    
    amano = 0;
    
    alpha = 255;
    
    puntos =  0;
    
    posi1 = 50;
    posi2 = 70;
    posi3 = 60;
    posi4 = 65;
    
    perdiste = false;
    ganaste = false;
    
     
    estado = 0;
    
  }
}
