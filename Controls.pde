void mousePressed() {
  saveFrame("Export/output-########.png");

}

void keyPressed() {
  char input = key;
  switch(input) {
    case 'f':
    case 'F':
      fadeOn = !fadeOn;
      break;
    case 'r':
    case 'R':
      if(fadeOn) {
       if(fadeAmount < 10){ fadeAmount += 1;}
       else if (fadeAmount < 255) { fadeAmount += 5;}
      }
      break;
    case 'v':
    case 'V':
      if(fadeOn) {
        if(fadeAmount > 10) {fadeAmount -= 5;}
        else if (fadeAmount > 0) { fadeAmount -= 1;}
      }
      break;
    case 'x':
    case 'X':
      background(bgColor);
      break;
    case 's':
    case 'S':
      randomizeAllSpeed();
      break;
    case 't':
    case 'T':
      if(rValue > 125) {
        rValue = 0;
      }else {
        rValue = 255;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'g':
    case 'G':
      if(rValue < 255){
        rValue += 5;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'b':
    case 'B':
      if(rValue > 0) {
        rValue -= 5;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'y':
    case 'Y':
      if(gValue > 125) {
        gValue = 0;
      } else {
        gValue = 255;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'h':
    case 'H':
      if(gValue < 255){
        gValue += 5;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'n':
    case 'N':
      if(gValue > 0) {
        gValue -= 5;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'u':
    case 'U':
      if (bValue > 125) {
        bValue = 0;
      }else {
        bValue = 255;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'j':
    case 'J':
      if (bValue < 255) {
        bValue += 5;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'm':
    case 'M':
      if (bValue > 0) { bValue -= 5;}
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'i':
    case 'I':
     
      if (aValue >125 ) {
        aValue = 0;
      } else {
        aValue = 255;
      }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'k':
    case 'K':
      if (aValue < 255) { aValue += 5; }
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case ',':
      if (aValue > 0) { aValue -= 5;}
      if(debug) println (rValue + " " + gValue + " " + bValue + " " + aValue);
      break;
    case 'p':
    case 'P':
      drawHand = !drawHand;
      break;
    case '1':
      saveFrame("Export/output-########.png");
      break;
    case '0':
      if(bgColor > 0) bgColor -= 5;
      fadeColor = bgColor;
      break;
    case '9':
      if(bgColor > 127) {bgColor = 0;}
      else {             bgColor = 255;}
      fadeColor = bgColor;
      break;
    case '8':
      if(bgColor < 255) bgColor += 5;
      fadeColor = bgColor;
      break;
    case 'a':
    case 'A':
      isCurves = !isCurves;
      break;
    case '7':
      if(speedMax < 440) speedMax += 25;
      randomizeAllSpeed();
      break;
    case '6':
      if(speedMax > 220) {speedMax = 15;}
      else {speedMax = 440;}
      randomizeAllSpeed();
      break;
    case '5':
      if(speedMax > 15) speedMax -= 25;
      randomizeAllSpeed();
      break;
     
  }

}
