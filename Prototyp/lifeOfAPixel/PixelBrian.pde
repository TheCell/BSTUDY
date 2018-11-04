class PixelBrian
{
  private Position position;
  private int sizeInPixel = 16;
  
  PixelBrian()
  {
    this.position = new Position(width / 2, height / 2);
  }
  
  void move()
  {
    this.position.move();
  }
  
  void moveTo(PVector position)
  {
    this.position.moveTo(position);
  }
  
  void draw()
  {
    fill(255);
    stroke(255);
    PVector pos = position.getPosition();
    ellipse(pos.x, pos.y, sizeInPixel, sizeInPixel);
  }
}
