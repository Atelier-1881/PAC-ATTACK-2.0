void drawGUI() { 
 
//Pacman
  fill(#FFF305);
  arc(112,350, 100,100, radians(45),radians(310));

//Bouton Play     
   fill(#FC7C03);
   noStroke();
   textFont(Score);
   textAlign(CENTER);
   textSize(40);
   textAlign(CENTER);
   text("PLAY",width/2,height/2);
//Signature    
   textFont(Atelier);
   textSize(20);
   fill(255);
   text("Atelier 1881",400,435);

//Animation images  
  if (millis() - lastTime >= DISPLAY_TIME) {
  counter = ++counter % images.length;
  lastTime = millis();
}
  image(images[counter], 270, 240);


//vitesse oscillation
 {
  tintAlpha = 128 + int(oscillate(millis(), 110.0f, 1000.0f));
  tint(tintRed, tintGreen, tintBlue, tintAlpha);
  image (Logo,50,40);
 }
}
  float oscillate(float time, float amplitude, float period){
    
  return amplitude * sin(time * 2 * PI / period);
}
