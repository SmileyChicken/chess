PImage wPawn; 
PImage wRook; 
PImage wHorse;
PImage wKnight; 
PImage wQueen; 
PImage wKing; 
PImage bPawn; 
PImage bRook; 
PImage bHorse; 
PImage bKnight; 
PImage bQueen; 
PImage bKing; 
PImage finish;
PImage endbox;
PImage cover;
Board b;
Square s1;
Square s2;
String typed;
String saved;
boolean click;


//class Piece
//{
 // String team;
  //String name;
  //PImage image;
  
 // Piece(String team, String name, PImage image)
  //{
    //this.team = team;
    //this.name = name;
    //this.image = image;
  //}
//}

void setup()
{
   wPawn = loadImage("wPawn.PNG");
   wRook = loadImage("wRook.PNG");
   wHorse = loadImage("wHorse.PNG");
   wKnight = loadImage("wKnight.PNG");
   wQueen = loadImage("wQueen.PNG");
   wKing = loadImage("wKing.PNG");
   bPawn = loadImage("bPawn.PNG");
   bRook = loadImage("bRook.PNG");
   bHorse = loadImage("bHorse.PNG");
   bKnight = loadImage("bKnight.PNG");
   bQueen = loadImage("bQueen.PNG");
   bKing = loadImage("bKing.PNG");
   finish = loadImage("FinishButton.PNG");
   endbox = loadImage("endbox.PNG");
   cover = loadImage("cover.PNG");
   s1 = null;
   s2 = null;
   typed = "";
   saved = "";
  background(#9B5397);
  //make board outline
  
  size(800, 800);
  rect(100, 100, 640, 640);
  b = new Board();
  b.display();
  b.resetPieces();
  finish.resize(150, 70);
  image(finish, 600, 5);
  textSize(15);
 
}

void draw()
{
  if(mousePressed)
  { 
    if((mouseX > 600 && mouseX < 750) && (mouseY > 5 && mouseY < 75))
    {
       image(endbox, 175, 250);
       exit();
    }
  }
}
 
 void keyPressed()
 {
   if(key == '\n')
   {
     
     saved = typed;
     text(saved, 100, 75);
     
     s2 = b.whichSquare(saved); 
     
     if(click && s1 != null && s2 != null && s1 != s2)
     {
       b.move(s1, s2);
       typed = "";
       saved = "";
       cover.resize(500, 69);
       image(cover, 100, 10);
     }
     else
     {
       text("invalid move. try again.", 120, 75); 
       typed = "";
       saved = "";
       
     }
   }
   else
   {
     typed = typed + key;
   }
   
 }
 void mouseClicked()
 {
   click = true;
   s1 = b.whichSquare(mouseX, mouseY);
   
   text("Where would you like to move this piece? \n Enter number and letter", 100, 30);
   
   
 
   }
   
