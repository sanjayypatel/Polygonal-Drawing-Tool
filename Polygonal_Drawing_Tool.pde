import processing.opengl.*;
import com.onformative.leap.*;
import com.leapmotion.leap.*;

//Initialize frequently changed variables
PVector  fingerPos;
int      particleCount  =  10 ;
boolean  fadeOn         =  true;
boolean  addToGif       =  false;
int      divisor        =  1; //displaysize/divsor becomes the size of the image
int      fadeAmount     =  125;
float    rValue         =  0;
float    gValue         =  125;
float    bValue         =  125;
float    aValue         =  255;
color    lineColorRGB   =  color(rValue, gValue, bValue, aValue);
int      offsetAmount   =  10;
boolean  drawHand       =  true;
boolean  drawParticles  =  false;
int      bgColor        =  0;
int      fadeColor      =  bgColor;
int      speedMax       =  15;
boolean  isCurves       =  false;

ArrayList<Particle> particles = new ArrayList<Particle>();
LeapMotionP5 leap = new LeapMotionP5(this);
ArrayList<Hand> hands;
ArrayList<Finger> fingers;


/****************DEBUG BOOLEAN FOR PRINTLNS ********/
boolean debug = false;
/***************************************************/


void setup() {
  if(debug) println("Setup begin");
  background(bgColor);
  size(displayWidth/divisor, displayHeight/divisor);
  smooth();
  frameRate(30);
  
  if(debug) println("Particles setup");

  speedMax = int(speedMax / divisor);   
  for (int i = 0; i < particleCount; i++) {
    //create and initialize particles (joints)
    particles.add(new Particle());
    particles.get(i).setDraw(drawParticles);
    particles.get(i).setColor(lineColorRGB); 
  }
  
  if(debug) println("End setup");
}


void draw() {
  lineColorRGB = color(rValue, gValue, bValue);
  
  //begin and end mark the points that form each line segment
  PVector begin = new PVector();
  PVector end = new PVector();
  PVector control1 = new PVector();
  PVector control2 = new PVector();

  //get finger and hand positions for leap interactions
  hands = leap.getHandList();
  fingers = leap.getFingerList();
  
  if (fadeOn) {
    //fade draws a transparent, black rect over the whole screen
    noStroke();
    fill(fadeColor, fadeAmount);
    if (aValue > 0) {
      rect(0, 0, width, height);
    }
  }
  
  noFill();
  
  for (int i = 0; i < hands.size(); i++) {
    PVector handPos = leap.getPosition(hands.get(i)); 
    float handSize = leap.getSphereRadius(hands.get(i)) * 2;
    stroke(lineColorRGB, aValue);
    
    if(drawHand) ellipse(handPos.x, handPos.y , handSize, handSize);
    
    for (int j = 0; j < fingers.size(); j++) {
      PVector fingerPos = leap.getTip(fingers.get(j));
      PVector originPos = leap.getOrigin(fingers.get(j));
      

      //line(fingerPos.x, fingerPos.y, originPos.x, originPos.y);

      //ellipse(fingerPos.x, fingerPos.y, 5, 5);
      //ellipse(originPos.x, originPos.y, 15, 15);
    }
  }   
  
 

  for (int i = 0; i < particleCount; i++) {
    //for each particle, get updated position and set begin/end points 
    //end is the current particle and begin is previous
    particles.get(i).setColor(lineColorRGB);
    particles.get(i).update();
    
    //end is current point
    end = particles.get(i).getPosition();//particles[i].getPosition();
    
    //set begin (last point)
    if (i > 0) {
      begin = particles.get(i-1).getPosition(); //particles[i-1].getPosition();
    } else if (i ==0) {
      begin = particles.get(particleCount-1).getPosition(); //particles[particleCount - 1].getPosition();
    } 
    
    //set control1 and control2 if curves active
    if(isCurves) {
      //set control1 - point before begin
      if(i > 1) { control1 = particles.get(i - 2).getPosition(); }
      else if(i == 0) { control1 = particles.get(particleCount-2).getPosition(); }
      else if (i == 1) { control1 = particles.get(particleCount-1).getPosition(); }
      
      //set control2 - point after end
      if(i < particleCount - 1) { control2 = particles.get(i + 1).getPosition(); }
      else if(i == particleCount - 1) { control2 = particles.get(0).getPosition(); }
    }
      
    
    
    stroke(lineColorRGB, aValue);
    if(!isCurves) {line(begin.x, begin.y, end.x, end.y);}
    else {bezier(begin.x, begin.y, control1.x, control1.y, width/2, height/2, end.x, end.y);}
    
    for (int j = 0; j < hands.size(); j++) {
      PVector handPos = leap.getPosition(hands.get(j)); 
      float handSize = leap.getSphereRadius(hands.get(j)) * 2;
      //calculate distance between particle and hand position
      float distance = sqrt( sq( end.x - handPos.x ) + sq( end.y - handPos.y) );
      
      if( distance <= handSize / 2) {
        particles.get(i).setSpeedX(particles.get(i).speedX * -1);
        particles.get(i).setSpeedY(particles.get(i).speedY * -1);
      }
    }
 
    
  }
 
}

boolean sketchFullScreen () {
  return true;
  //return false;
}

void randomizeAllSpeed(){
   for(int i = 0; i < particleCount; i++) {
     particles.get(i).speedRandomize();
   }
}




