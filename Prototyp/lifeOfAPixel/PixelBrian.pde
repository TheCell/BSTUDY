class PixelBrian
{
  private Position position;
  private int sizeInPixel = 16;
  private PixelFood currentFoodGoal;
  
  PixelBrian()
  {
    this.position = new Position(width / 2, height / 2);
  }
  
  public void logicStep()
  {
    move();
    eatIfReachable();
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
    float distanceToFood = PVector.dist(this.position.getPosition(), this.currentFoodGoal.getPosition());
    if (distanceToFood < this.sizeInPixel)
    {
      eatFood();
      generateNewFood();
    }
  }
  
  private void eatFood()
  {
    switch(this.currentFoodGoal.foodType)
    {
      case WATER:
        this.position.maxTurnPerCall = this.position.maxTurnPerCall + (QUARTER_PI / 8);
      break;
      case ENERGY:
        this.position.speed = this.position.speed + 1;
      break;
      case FOOD:
        this.sizeInPixel = this.sizeInPixel + 1;
      break;
      default:
      break;
    }
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
