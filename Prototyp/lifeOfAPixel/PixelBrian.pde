class PixelBrian
{
  private Position position;
  private int sizeInPixel = 26;
  private PixelFood currentFoodGoal;
  private color briansColor = #FFFFFF;
  
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
  
  public void generateNewFood()
  {
    this.currentFoodGoal = new PixelFood();
    setFood(this.currentFoodGoal);
  }
  
  private void eatFood()
  {
    switch(this.currentFoodGoal.foodType)
    {
      case WATER:
        this.position.maxTurnPerCall = this.position.maxTurnPerCall + (QUARTER_PI / 8);
        changeSizeBy(-2);
        addColor(FOODTYPE.WATER.getColor());
      break;
      case ENERGY:
        changeSpeedBy(1);
        changeSizeBy(-2);
        addColor(FOODTYPE.ENERGY.getColor());
      break;
      case FOOD:
        changeSizeBy(4);
        changeSpeedBy(-0.5);
        addColor(FOODTYPE.FOOD.getColor());
      break;
      default:
      break;
    }
  }
  
  private void changeSizeBy(int size)
  {
    if (this.sizeInPixel + size > 0 && this.sizeInPixel + size < 50)
    {
      this.sizeInPixel = this.sizeInPixel + size;
    }
  }
  
  private void changeSpeedBy(float speed)
  {
    if (this.position.speed + speed > 0.0 && this.position.speed + speed < 25.0f)
    {
      this.position.speed = this.position.speed + speed;
    }
  }
  
  private void addColor(color colorToAdd)
  {
    color currentColor = this.briansColor;
    color newColor = lerpColor(currentColor, colorToAdd, 0.3);
    this.briansColor = newColor;
  }
  
  public void draw()
  {
    fill(this.briansColor);
    stroke(this.briansColor);
    PVector pos = position.getPosition();
    ellipse(pos.x, pos.y, sizeInPixel, sizeInPixel);
    currentFoodGoal.draw();
  }
}
