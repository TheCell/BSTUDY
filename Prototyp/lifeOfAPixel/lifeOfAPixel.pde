PixelBrian briansLife;

void setup()
{
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
  briansLife.move();
}
