class Square
{
  int xcorner;
  int ycorner;
  boolean isBlack;
  PImage piece;
  
  Square()
  {
    isBlack = false;
    piece = null;
  }
  
  Square(int x, int y, boolean c, PImage p)
  {
    xcorner = x;
    ycorner = y;
    isBlack = c;
    piece = p;
  }
  
  boolean getIsBlack()
  {
    return isBlack;
  }
  
  int getXCorner()
  {
    return xcorner;
  }
  
  int getYCorner()
  {
    return ycorner;
  }
  
  PImage getPiece()
  {
    return piece;
  }
  
  void turnBlack()
  {
    fill(0);
    rect(xcorner, ycorner, 80, 80);
    
  }
  
  void turnWhite()
  {
    fill(255);
    rect(xcorner, ycorner, 80, 80);
    
  }
  
  void setPiece(PImage p)
  {
    piece = p;
    
  } 
  
  void display()
  {
     if(isBlack)
    {
      fill(0);
      rect(xcorner, ycorner, 80, 80);
    }
    
    if(piece != null)
    {
      piece.resize(50, 60);
      image(piece, xcorner + 10, ycorner + 10);
    }
    
  }
}
