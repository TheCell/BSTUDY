class Position
{
  public float speed = 3.3;
  private float currentAngle = 0.0;
  private PVector currentPosition;
  private PVector targetPosition;
  public float maxTurnPerCall = QUARTER_PI / 16;
  private boolean showVectors = false;
  
  public Position()
  {
    this((int) random(0, width), (int) random(0, height));
  }
  
  public Position(int x, int y)
  {
    this.currentPosition = new PVector(x, y);
    this.targetPosition = new PVector(width / 2, height /2);
  }
  
  private void correctAngle()
  {
    PVector forwardVector = forwardVector();
    PVector foodDirection = PVector.sub(this.targetPosition, this.currentPosition);
    float angledirection = PVector.dot(forwardVector, foodDirection);
    
    forwardVector.mult(100.0);
    
    if (showVectors)
    {
      line(this.currentPosition.x, this.currentPosition.y, this.currentPosition.x + forwardVector.x, this.currentPosition.y + forwardVector.y);
      line(this.currentPosition.x, this.currentPosition.y, this.targetPosition.x, this.targetPosition.y);
    }
    float radiantAngle = PVector.angleBetween(forwardVector, foodDirection);
    
    if (radiantAngle > maxTurnPerCall)
    {
      radiantAngle = maxTurnPerCall;
    }
    
    if (radiantAngle > 0.01)
    {
      this.currentAngle = this.currentAngle + radiantAngle;
    }
  }
  
  public void moveTo(PVector targetPosition)
  {
    this.targetPosition = targetPosition;
  }
  
  public void move()
  {
    correctAngle();
    
    PVector newPos = PVector.add(this.currentPosition, forwardVector());
    this.setPosition(newPos.x, newPos.y);
  }
  
  private PVector forwardVector()
  {
    PVector forwardVector = new PVector(1, 0);
    forwardVector.rotate(this.currentAngle);
    forwardVector.normalize();
    forwardVector.mult(this.speed);
    return forwardVector;
  }
  
  private void setPosition(float x, float y)
  {
    if (x > width)
    {
      x = width;
    }
    else if (x < 0)
    {
      x = 0;
    }
    
    if (y > height)
    {
      y = height;
    }
    else if (y < 0)
    {
      y = 0;
    }
    
    currentPosition.x = x;
    currentPosition.y = y;
  }
  
  public PVector getPosition()
  {
    return this.currentPosition;
  }
}
