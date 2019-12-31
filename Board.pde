class Board
{
  Square[][] board;
  PImage[] whitePieces;
  PImage[] blackPieces;
  
  Board()
  {
    board = new Square[8][8];
    
    int x = 100;
    int y = 100;
    boolean wb = false;
    
    for(int r = 0; r < 8; r ++)
    {
      for(int c = 0; c < 8; c ++)
      {
        board[r][c] = new Square(x, y, wb, null);
        x = x + 80;
        wb = !wb;
      }
      y = y + 80;
      x = 100;
      wb = !wb;
    }
    
    whitePieces = new PImage[16];
    for(int i = 0; i < 8; i ++)
    {
      whitePieces[i] =  wPawn;
    }
    
    whitePieces[8] = wRook;
    whitePieces[9] = wRook;
    whitePieces[10] = wHorse;
    whitePieces[11] = wHorse;
    whitePieces[12] = wKnight;
    whitePieces[13] = wKnight;
    whitePieces[14] = wQueen;
    whitePieces[15] =  wKing;
    
    blackPieces = new PImage[16];
    for(int i = 0; i < 8; i ++)
    {
      blackPieces[i] = bPawn;
    }
    
    blackPieces[8] = bRook;
    blackPieces[9] = bRook;
    blackPieces[10] = bHorse;
    blackPieces[11] = bHorse;
    blackPieces[12] = bKnight;
    blackPieces[13] = bKnight;
    blackPieces[14] = bQueen;
    blackPieces[15] = bKing;
    
    
  }
  
  Square whichSquare(int x, int y)
  {
    for(int r = 0; r < board.length; r++)
    {
      for(int c = 0; c < board[0].length; c ++)
      {
        if(x >= board[r][c].getXCorner() && x < board[r][c].getXCorner()  + 80)
        {
          if(y >= board[r][c].getYCorner() && y < board[r][c].getYCorner()  + 80)
            return board[r][c];
        }
      }
    }
    return null;
  }
  
  Square whichSquare(String s)
  {
    int r = (int) s.charAt(0) - 48;
    switch(r)
    {
      case 1:
        r = 7;
        break;
      case 2:
        r = 6;
        break;
      case 3:
        r = 5;
        break;
      case 4:
        r = 4;
        break;
      case 5:
        r = 3;
        break;
      case 6:
        r = 2;
        break;
      case 7:
        r = 1;
        break;
      case 8:
        r = 0;
        break;
      default:
        return null;
    }
    int c;
    switch(s.charAt(1))
    {
      case 'a': 
        c = 0; 
        break;
      case 'b':
        c = 1;
        break;
      case 'c':
        c = 2;
        break;
      case 'd':
        c = 3;
        break;
      case 'e':
        c = 4;
        break;
      case 'f':
        c = 5;
        break;
      case 'g':
        c = 6;
        break;
      case 'h':
        c = 7;
        break;
      default:
        return null;
    }
    return board[r][c];
  }
  
  void display()
  {
    
    for(int r = 0; r < 8; r ++)
    {
      for(int c = 0; c < 8; c ++)
      {
        board[r][c].display();
      }
    }
    
    text("8", 90, 140);
    text("7", 90, 220);
    text("6", 90, 300);
    text("5", 90, 380);
    text("4", 90, 460);
    text("3", 90, 540);
    text("2", 90, 620);
    text("1", 90, 700);
    
    text("a", 140, 90);
    text("b", 220, 90);
    text("c", 300, 90);
    text("d", 380, 90);
    text("e", 460, 90);
    text("f", 540, 90);
    text("g", 620, 90);
    text("h", 700, 90);
    
  }
  
  void resetPieces()
  {
    board [0][0].setPiece(blackPieces[8]);
    board [0][1].setPiece(blackPieces[10]);
    board [0][2].setPiece(blackPieces[12]);
    board [0][3].setPiece(blackPieces[14]); 
    board [0][4].setPiece(blackPieces[15]); 
    board [0][5].setPiece(blackPieces[13]); 
    board [0][6].setPiece(blackPieces[11]);  
    board [0][7].setPiece(blackPieces[9]);
    board [1][0].setPiece(blackPieces[0]);
    board [1][1].setPiece(blackPieces[1]);
    board [1][2].setPiece(blackPieces[2]);
    board [1][3].setPiece(blackPieces[3]); 
    board [1][4].setPiece(blackPieces[4]); 
    board [1][5].setPiece(blackPieces[5]); 
    board [1][6].setPiece(blackPieces[6]);  
    board [1][7].setPiece(blackPieces[7]);
    
    board [7][0].setPiece(whitePieces[8]);
    board [7][1].setPiece(whitePieces[10]);
    board [7][2].setPiece(whitePieces[12]);
    board [7][3].setPiece(whitePieces[14]); 
    board [7][4].setPiece(whitePieces[15]); 
    board [7][5].setPiece(whitePieces[13]); 
    board [7][6].setPiece(whitePieces[11]);  
    board [7][7].setPiece(whitePieces[9]);
    board [6][0].setPiece(whitePieces[0]);
    board [6][1].setPiece(whitePieces[1]);
    board [6][2].setPiece(whitePieces[2]);
    board [6][3].setPiece(whitePieces[3]); 
    board [6][4].setPiece(whitePieces[4]); 
    board [6][5].setPiece(whitePieces[5]); 
    board [6][6].setPiece(whitePieces[6]);  
    board [6][7].setPiece(whitePieces[7]);
    
    display();
  }
  
  void move(Square s1, Square s2)
  {
    s2.setPiece(s1.getPiece());
   // image(s2.getPiece(), 0, 0); 
    s1.setPiece(null);
    if(s1.getIsBlack())
    {
      s1.turnBlack();
    }
    else
      s1.turnWhite();
    s2.display();
    
    //image(s1.getPiece(), 0, 0);
  }
  
}
