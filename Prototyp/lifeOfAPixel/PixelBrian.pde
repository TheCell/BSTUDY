class PixelBrian
{
  private Position position;
  private int sizeInPixel = 16;
  private PixelFood currentFoodGoal;
  
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
  
  private void setFood(PixelFood pixelFood)
  {
    this.currentFoodGoal = pixelFood;
    moveTo(pixelFood.getPosition());
  }
  
  private void eatIfReachable()
  {
    
  }
  
  public void generateNewFood()
  {
    this.currentFoodGoal = new PixelFood();
    setFood(this.currentFoodGoal);
  }
  
  void draw()
  {
    fill(255);
    stroke(255);
    PVector pos = position.getPosition();
    ellipse(pos.x, pos.y, sizeInPixel, sizeInPixel);
    currentFoodGoal.draw();
  }
}
