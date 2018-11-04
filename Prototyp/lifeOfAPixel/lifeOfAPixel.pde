PixelBrian briansLife;
int counter = 0;
PVector foodPosition;
int foodLife = 200;

void setup()
{
  size(800, 800);
  briansLife = new PixelBrian();
  this.foodPosition = new PVector(random(0, width), random(0, height));
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
  this.foodPosition = new PVector(random(0, width), random(0, height));
  briansLife.moveTo(foodPosition);
}

void drawFoodPosition()
{
  fill(255);
  stroke(255);
  PVector pos = this.foodPosition;
  ellipse(pos.x, pos.y, 8, 8);
}
