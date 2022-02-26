//Initialisation fontions souris
final int Enter_STATE=0;
final int Clic_STATE=2;
int state=Enter_STATE;

//Postion Pacman de départ
int playerX=170,playerY=330;

//Fonction Pacman
int radius = 25;
int direction = 1;

//Initialisation Pointage
int currentNumber;
int numberIncrease;
int endNumber;

//images

PImage Logo;

//Typo
PFont Score;
PFont Atelier;

//Fichiers sonores
SoundFile file;
String audioName1 = "data/a12.mp3";
String path1;
String audioName2 = "data/a14.mp3";
String path2;
String audioName3 = "data/a15.mp3";
String path3;
String audioName4 = "data/a16.mp3";
String path4;
import processing.sound.*;

//Effets visuels
int tintRed    =255;
int tintGreen  =255;
int tintBlue   =255;
int tintAlpha  =255;

//Initialisation sequence images
PImage[] images = new PImage[8]; 
int counter; 
final int DISPLAY_TIME = 41; 
int lastTime; 


void setup(){

// dimension
  size(500,440);

//Intro son a12.mp3
  path1 = sketchPath(audioName1);
  file = new SoundFile(this, path1);
  file.play();

//Images
  Logo    = loadImage("Logo.png");

//Typo
  Score   = loadFont ("ArialRoundedMTBold-30.vlw");
  Atelier = loadFont ("Bahnschrift-20.vlw");

//Animation images
  for (int i = 0; i < images.length; i++){
    
    images[i] = loadImage("ghost" + nf(i+1, 2) + ".jpg"); 
}
  lastTime = millis();


//Score conteur
  currentNumber = 0; 
  numberIncrease = 1; 
  endNumber = 1881; 
//MasqueScore
  fill(0);
  rect(0,140,500,80);
}


void draw(){

//masque acceuil
  fill(0);  
  rect(0,0,500,140);
  rect(0,220,340,300);
  rect(0,140,340,80);
  rect(340,420,260,20);
  rect(340,220,260,20);

//Activation fonctions clavier
handleKeyStates();

//marqueur de position  
  fill(0);
  textSize(10);
  text ( "("+playerX+","+playerY+")",mouseX,mouseY);  
   
   
//bascule interfaces
  switch(state) {
  case Clic_STATE:
  Gameinterface();
  break;
  default:

//Activation interface acceuil   
drawGUI();
 
 }
}

//Avtivation fonctions souris
void mousePressed(){

//Zone du bouton PLAY
  if(state==Enter_STATE){
 
  if ((mouseX>=width/2-50 && mouseX<=width/2+50) && (mouseY>=height/2-40 && mouseY<=height/2+40)) state=Clic_STATE;
  
//Transition son a16.mp3
  path4 = sketchPath(audioName4);
  file = new SoundFile(this, path4);
  file.play();

//Activation Interface jeu
Gameinterface();
 
 }
}
  
