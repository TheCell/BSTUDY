class PixelFood
{
  FOODTYPE foodType;
  Position position;
  
  PixelFood()
  {
    int randomFoodType = (int) random(0, FOODTYPE.values().length);
    this.foodType = FOODTYPE.values()[randomFoodType];
    this.position = new Position();
  }
  
  public void newPosition()
  {
    this.position = new Position();
  }
  
  public PVector getPosition()
  {
    return this.position.currentPosition;
  }
  
  public void draw()
  {
    color foodColor = this.foodType.getColor();
    fill(foodColor);
    stroke(foodColor);
    PVector pos = this.position.getPosition();
    ellipse(pos.x, pos.y, 8, 8);
  }
}

public enum FOODTYPE
{
  WATER, ENERGY, FOOD;
  
  public int getColor()
  {
    switch (this)
    {
       case WATER:
         return #4286f4;
       case ENERGY:
         return #ebf441;
       case FOOD:
         return #46f441;
       default:
         return #cecece;
    }
  }
}
