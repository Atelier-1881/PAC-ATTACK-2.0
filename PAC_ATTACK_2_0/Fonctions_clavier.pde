//Directions
boolean holdRight = false;
boolean holdLeft = false;
boolean holdUp = false;
boolean holdDown = false;

void keyPressed(){ 

// score counter  
fill(0);

rect(340,0,260,240);
fill(255);
textSize(20);
currentNumber += numberIncrease; 
text("SCORE "+currentNumber,400,160);
//Fin du compteur
if(currentNumber == endNumber){ 
exit();}

//refresh Hi-Score
fill(#BC0404);
textSize(20);
text("HI-SCORE",400,40);
text("1UP",400,100);
fill(255);
text("00188100",400,60);
 
//Initialisation touches clavier
 
 if (keyCode == RIGHT){
   holdRight= true;
   
   direction = 1;  
  }
  if (keyCode == LEFT){
   holdLeft= true;
  
   direction = -1;  
  }
   if (keyCode == UP){
   holdUp= true;
  
   direction = -1;  
  }
  if (keyCode == DOWN){
   holdDown= true;
  
   direction = 1;
  }
}



void keyReleased(){
 
  if (key == 'z')
    save("Atelier1881.jpg");
  
//Chomp sound a14.mp3 au relachement de la touche
path2 = sketchPath(audioName2);
file = new SoundFile(this, path2);
file.play(); 
  
   if (keyCode == RIGHT){
   holdRight= false;
  }
  if (keyCode == LEFT){
   holdLeft= false;
  }
   if (keyCode == UP){
   holdUp= false;
  }
  if (keyCode == DOWN){
   holdDown= false;
  }
}


//actions de mouvements
void handleKeyStates(){

int pxWas = playerX;
int pyWas =playerY;

//Vitesse mouvemement 
  if(holdRight){
    playerX=playerX+2;
  }
  if(holdLeft){
    playerX=playerX-2;
  }
  if(holdUp){
    playerY=playerY-2;
  }
  if(holdDown){
    playerY=playerY+2; 
  }
    
//Changement des tuiles apres contact    
int tileUnderPlayer = whatIsUnderThisCoordinate(playerX ,playerY);
    
    if (tileUnderPlayer == GRID_TYPE_WALL){
     playerX = pxWas;
     playerY = pyWas; 
  
    }else if (tileUnderPlayer == GRID_TYPE_COIN){ 
              changeTile(playerX,playerY, GRID_TYPE_SPACE);
 
    }else if (tileUnderPlayer == GRID_TYPE_POWER){ 
              changeTile(playerX,playerY, GRID_TYPE_SPACE);
   
//Bonus sound a15.mp3 contact bonus
path3 = sketchPath(audioName3);
file = new SoundFile(this, path3);
file.play();

    
}
}
