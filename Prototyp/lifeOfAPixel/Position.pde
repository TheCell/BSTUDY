class Position
{
  private int x;
  private int y;
  private float angle;
  private float maxTurnPerCall = 20.0f;
  
  public Position(int x, int y)
  {
    this.x = x;
    this.y = y;
    this.angle = 0.0;
  }
  
  public void setPosition(int x, int y)
  {
    if (x > width)
    {
      x = width;
    }
    else if (x < 0)
    {
      x = 0;
    }
    
    if (y > height)
    {
      y = height;
    }
    else if (y < 0)
    {
      y = 0;
    }
    
    this.x = x;
    this.y = y;
  }
}
