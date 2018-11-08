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
  drawExplanation();
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

void drawExplanation()
{
  textSize(24);
  fill(#ebf441);
  text("energy: speed +, fatness -", 10, 30);
  fill(#4286f4);
  text("water: turnspeed +, fatness -", 10, 60);
  fill(#46f441);
  text("food: speed -, fatness +", 10, 90);
}
