
//Initialisation dimensions Grid
final int GRID_TILE_WIDTH = 20;
final int GRID_TILE_HEIGHT = GRID_TILE_WIDTH ;

//Initialisation fonctions de cases
final int GRID_TYPE_SPACE =0;
final int GRID_TYPE_WALL =1;
final int GRID_TYPE_COIN = 2;
final int GRID_TYPE_POWER = 3;

//Assignation des cases
  int [][]worldGrid = {{1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1},
                      {1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1},
                      {1,3,1,1,2,1,1,2,1,2,1,1,2,1,1,3,1},
                      {1,2,1,1,2,1,1,2,1,2,1,1,2,1,1,2,1},
                      {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
                      {1,2,1,1,2,1,2,1,1,1,2,1,2,1,1,2,1},
                      {1,2,2,2,2,1,2,2,1,2,2,1,2,2,2,2,1},
                      {1,1,1,1,2,1,1,0,1,0,1,1,2,1,1,1,1},
                      {1,1,1,1,2,1,0,0,0,0,0,1,2,1,1,1,1},
                      {1,1,1,1,2,1,0,1,1,1,0,1,2,1,1,1,1},
                      {0,0,0,0,2,0,0,1,1,1,0,0,2,0,0,0,0},
                      {1,1,1,1,2,1,0,1,1,1,0,1,2,1,1,1,1},
                      {1,1,1,1,2,1,0,0,0,0,0,1,2,1,1,1,1},
                      {1,1,1,1,2,1,0,1,1,1,0,1,2,1,1,1,1},
                      {1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1},
                      {1,2,1,1,2,1,1,2,1,2,1,1,2,1,1,2,1},
                      {1,2,2,1,2,2,2,2,0,2,2,2,2,1,2,2,1},
                      {1,1,2,1,2,1,2,1,1,1,2,1,2,1,2,1,1},
                      {1,2,2,2,2,1,2,2,1,2,2,1,2,2,2,2,1},
                      {1,3,1,1,1,1,1,2,1,2,1,1,1,1,1,3,1},
                      {1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,1},
                      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}};
                    
//Initialisation positionnement
  int whatIsUnderThisCoordinate (int someX, int someY) {
  int someTileRow = someY / GRID_TILE_HEIGHT;
  int someTileCol = someX / GRID_TILE_WIDTH;

//Fonction des tuiles  murs
  if(someY <0){
     return GRID_TYPE_WALL;
}
  if(someX <0){
     return GRID_TYPE_WALL;
}
  if (someTileRow >=worldGrid.length){
     return GRID_TYPE_WALL; 
}
  if (someTileCol >=worldGrid[0].length){
     return GRID_TYPE_WALL;
}
  return worldGrid [someTileRow] [someTileCol] ;
}

//Fonction changement d'état des tuiles
void changeTile (int someX, int someY,int changeTo) {
   int someTileRow = someY / GRID_TILE_HEIGHT;
   int someTileCol = someX / GRID_TILE_WIDTH;
   
   if(someY <0){
     return ;
  }
   if(someX <0){
     return ;
  }
   if (someTileRow >=worldGrid.length){
     return ; 
   }
   if (someTileCol >=worldGrid[0].length){
     return ;
   }
   worldGrid [someTileRow] [someTileCol] = changeTo;
  } 

//Initialisation des tuiles
void worldDrawGrid(){
     
  noStroke();
  for(int row=0;row<worldGrid.length;row++){
  for(int col=0;col<worldGrid[row].length;col++){
  switch (worldGrid [row] [col]){
  case GRID_TYPE_SPACE:
  fill(0);
  rect(col*GRID_TILE_WIDTH,row*GRID_TILE_HEIGHT,GRID_TILE_WIDTH,GRID_TILE_HEIGHT);
  break;
  case GRID_TYPE_WALL:
  noFill();
  rect(col*GRID_TILE_WIDTH,row*GRID_TILE_HEIGHT,GRID_TILE_WIDTH,GRID_TILE_HEIGHT);
  break;
  
//Initialisation tuiles points
 
  case GRID_TYPE_COIN:
  fill(255,255,0);
  ellipse( col*GRID_TILE_WIDTH + GRID_TILE_WIDTH/2,
           row*GRID_TILE_HEIGHT + GRID_TILE_HEIGHT/2,7,7);
  fill(0);
  break;
  case GRID_TYPE_POWER:
           
  fill(255,255,0);
           
  ellipse( col*GRID_TILE_WIDTH + GRID_TILE_WIDTH/2,
           row*GRID_TILE_HEIGHT + GRID_TILE_HEIGHT/2,15,15);
  fill(0);
  break;
        
}}}}
