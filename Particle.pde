class Particle {
  PVector location = new PVector();
  PVector previous = new PVector();
  float speedY = random (-speedMax, speedMax);
  float speedX = random (-speedMax, speedMax);
  color c = color(0, 0, 0);
  boolean drawMe = true;
  //float accelerationX = 1;
  Particle() {
    location.x = random(0, width);
    location.y = random(0, height);
  }
  Particle(PVector origin) {
    location.x = origin.x;
    location.y = origin.y;
  }
  void update (){
    if(previous.x == 0) {
      previous.set(location);
    }
    location.y += speedY;
    location.x += speedX;
    //accelerationX++;
    if( location.y > height) {
      location.y = height - 1;
      speedY *= -1;
    }else if(location.y < 0) {
      location.y = 0;
      speedY *= -1;
    }
    
    if (location.x > width) {
      location.x = width - 1;
      speedX *= -1;
    }else if( location.x < 0) {
      location.x = 0;
      speedX *= -1;
    }

    
    if(drawMe) {visualize();}
    previous.set(location);
  }
  void visualize() {
    stroke(c,aValue);
    fill(c, aValue);
    ellipse(location.x, location.y, 2, 2);

  }
  void speedRandomize() {
    speedX = random(-speedMax, speedMax);
    speedY = random(-speedMax, speedMax);
  }
  PVector getPosition() {
    return location;
  }
  color getColor(){
    return c;
  }
  void setColor(color lineColor) {
    c = lineColor;
  }
  void setDraw(boolean On) {
    drawMe = On;
  }
  
  void setSpeedX(float x) {
    speedX = x;
  }
  void setSpeedY(float x) {
    speedY = x;
  }
      
}
