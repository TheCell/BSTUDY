PixelBrian briansLife;
int counter = 0;
int foodLife = 200;

void setup()
{
  pixelDensity(2); // change this to resize the canvas on different displays
  size(800, 800);
  briansLife = new PixelBrian();
}

void draw()
{
  background(50);
  physicsStep();
  briansLife.draw();
}

void physicsStep()
{
  if (counter == 0)
  {
    briansLife.generateNewFood();
  }
  counter = counter > foodLife ? 0 : counter + 1;
  
  briansLife.logicStep();
}
