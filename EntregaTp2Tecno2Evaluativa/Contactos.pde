float opacidadImagen = 1000;


void contactPersisted(FContact c) {
  FBody body1 = c.getBody1();
  FBody body2 = c.getBody2();
  
    //rata desaparece de a poco al tocar el suelo
  if (body1.getName() == "suelo" && body2.getName() == "cuerpo" || body2.getName() == "suelo" && body1.getName() == "cuerpo" ) {  //si el cuerpo "cuerpo" y el cuerpo "suelo" colapsan, entra en el if 
    cuerpo.setImageAlpha (opacidadImagen);
    if ( opacidadImagen <= 1000 ) {            //si "cuerpo" y "suelo" colapsan opcidadImagen afecta la img de la rata
      opacidadImagen = opacidadImagen -10;
    }
    if ( opacidadImagen <= 0) {
      mundo.remove(cuerpo);     //si opacidadImagen llega a 0, la rata se elimina del mundo y opacidadImagen vuelve a 1000
      opacidadImagen = 1000;
    }
  }
  
  //rata desaparece de apoco si se queda en contacto con la catapulta (previene bug de la rata trabada en la catapulta)
    if (body1.getName() == "catapulta" && body2.getName() == "cuerpo" || body2.getName() == "catapulta" && body1.getName() == "cuerpo" ) {  //si el cuerpo "cuerpo" y el cuerpo "suelo" colapsan, entra en el if 
    cuerpo.setImageAlpha (opacidadImagen);
    if ( opacidadImagen <= 1000 ) {            //si "cuerpo" y "suelo" colapsan opcidadImagen afecta la img de la rata
      opacidadImagen = opacidadImagen -10;
    }
    if ( opacidadImagen <= 0) {
      mundo.remove(cuerpo);     //si opacidadImagen llega a 0, la rata se elimina del mundo y opacidadImagen vuelve a 1000
      opacidadImagen = 1000;
    }
  }
  
  //rata desaparece si coliciona con otra rata (previene el bug de que se queden muchas rtas juntas y ya no se pueda tirar (mas o menos))
  if (body1.getName() == "cuerpo" && body2.getName() == "cuerpo" || body2.getName() == "cuerpo" && body1.getName() == "cuerpo"){  
    mundo.remove(body1);
       mundo.remove(body2);
  }
  
  //ingrediente toca el suelo, desaparece y el siguiente aparece en posición
  if (body1.getName() == "suelo" && body2.getName() == "ingrediente1" || body2.getName() == "suelo" && body1.getName() == "ingrediente1" ) {  //si el ingrediente1 y el suelo colapsan, entra en el if 
    ingr= 1;
        hit.play();
    mundo.remove(ingrediente1);
  }
  if (body1.getName() == "suelo" && body2.getName() == "ingrediente2" || body2.getName() == "suelo" && body1.getName() == "ingrediente2" ) {  //si el ingrediente2 y el suelo colapsan, entra en el if 
    ingr= 2;
        hit.play();
    mundo.remove(ingrediente2);
  }
  if (body1.getName() == "suelo" && body2.getName() == "ingrediente3" || body2.getName() == "suelo" && body1.getName() == "ingrediente3" ) {  //si el ingrediente3 y el suelo colapsan, entra en el if 
    ingr= 3;
        hit.play();
    mundo.remove(ingrediente3);
  }
    if (body1.getName() == "suelo" && body2.getName() == "ingrediente4" || body2.getName() == "suelo" && body1.getName() == "ingrediente4" ) {  //si el ingrediente4 y el suelo colapsan, entra en el if 
    ingr= 4;
        hit.play();
    mundo.remove(ingrediente4);
  }
      if (body1.getName() == "suelo" && body2.getName() == "ingrediente5" || body2.getName() == "suelo" && body1.getName() == "ingrediente4" ) {  //si el ingrediente5 y el suelo colapsan, entra en el if 
    ingr= 5;
        hit.play();
    mundo.remove(ingrediente5);
  }

  //fuerzas de los ingredientes. Cuando rata toca la catapulta se le suma fuerza al ingrediente
    if (body1.getName() == "catapulta" && body2.getName() == "cuerpo" || body2.getName() == "catapulta" && body1.getName() == "cuerpo" ) { 
    ingrediente1.addForce(26000, 2000);

  }
  if (body1.getName() == "catapulta" && body2.getName() == "cuerpo" || body2.getName() == "catapulta" && body1.getName() == "cuerpo" ) {  
    ingrediente2.addForce(8000, 3000);

  }
  if (body1.getName() == "catapulta" && body2.getName() == "cuerpo" || body2.getName() == "catapulta" && body1.getName() == "cuerpo" ) {   
    ingrediente3.addForce(27000, 25000);
  }
    if (body1.getName() == "catapulta" && body2.getName() == "cuerpo" || body2.getName() == "catapulta" && body1.getName() == "cuerpo" ) {   
    ingrediente4.addForce(25000, 6000);
  }
      if (body1.getName() == "catapulta" && body2.getName() == "cuerpo" || body2.getName() == "catapulta" && body1.getName() == "cuerpo" ) {   
    ingrediente5.addForce(26000, 12000);
  }

}
