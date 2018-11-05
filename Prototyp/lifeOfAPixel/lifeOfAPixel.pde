PixelBrian briansLife;
int counter = 0;
PixelFood pixelFood;
int foodLife = 200;

void setup()
{
  pixelDensity(2); // change this to resize the canvas on different displays
  size(800, 800);
  briansLife = new PixelBrian();
  this.pixelFood = new PixelFood();
}

void draw()
{
  background(50);
  physicsStep();
  briansLife.draw();
  drawFoodPosition();
}

void physicsStep()
{
  if (counter == 0)
  {
    setNewFoodPosition();
  }
  counter = counter > foodLife ? 0 : counter + 1;
  
  briansLife.move();
}

void setNewFoodPosition()
{
  this.pixelFood.newPosition();
  briansLife.moveTo(this.pixelFood.getPosition());
}

void drawFoodPosition()
{
  this.pixelFood.draw();
}
