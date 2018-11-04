class PixelBrian
{
  private float speed = 2.5;
  private Position position;
  private int sizeInPixel = 16;
  
  PixelBrian()
  {
    position = new Position(width / 2, height / 2);
  }
  
  void move()
  {
    int x = position.x + (int) random(-speed, speed);
    int y = position.y + (int) random(-speed, speed);
    
    position.setPosition(x, y);
  }
  
  void draw()
  {
    fill(255);
    stroke(255);
    ellipse(position.x, position.y, sizeInPixel, sizeInPixel);
  }
}
