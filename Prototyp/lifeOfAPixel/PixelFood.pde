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
}

public enum FOODTYPE
{
  WATER, ENERGY, FOOD
}
