//Alice Wang 
//Feb 6

PImage leftArrow;
PImage rightArrow;

int mode = 0; //Tracks the current pattern in display

void setup() {
  size(600, 600);
  
  leftArrow = loadImage("left.png");
  rightArrow = loadImage("right.png");
}

void draw() {
  background(0);

  if (mode == 0) {
    bouncingBalls();
  }
  else if (mode == 1) { 
    growingSquares(); 
  }
  else if (mode == 2) {
    colourStripes();
  }
  
  drawArrows();
}

void drawArrows() {
  
  image(leftArrow, 25, 250, 100, 100);
  image(rightArrow, 475, 250, 100, 100);
  
}
  
void mousePressed() {
  if (mouseTouchingButton(25, 250, 100, 100)) { // Left arrow
    mode = (mode + 2) % 3; 
  }

  if (mouseTouchingButton(475, 250, 100, 100)) { // Right arrow
    mode = (mode + 1) % 3; 
  }
}


boolean mouseTouchingButton(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
  
}

float t = 0;

void bouncingBalls() {
  int columns = 8, rows = 8;
  float spacing = width / columns;
  
  t += 0.25;
  
  for (int i = 0; i < columns; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * spacing + spacing / 2; //Centres the circle in the middle of the grid
      float y = j * spacing + spacing / 2 + sin(t + i * 0.5) * 10; // Wavy effect
      fill(255, 100 + 100 * sin(t + j * 0.3), 200); 
      ellipse(x, y, 10, 10);
    }
  }
}


float[] size = new float[10];

void growingSquares() {
  for (int i = 0; i < size.length; i++) {
    size[i] += 2;
    
    if (size[i] > 100) {
    size[i] = 0;
    }
    
    fill(random(255), random(255), random(255));
    rect(random(width), random(height), size[i], size[i]);
  }
}


void colourStripes() {
 
  int numberOfStripes = 10;
  float stripeWidth = width / numberOfStripes;

  for (int i = 0; i < numberOfStripes; i++) {
    int red = (frameCount + i * 20) % 255; //looked this up
    int green = 150;  
    int blue = 255;  
    fill(red, green, blue);
    rect(i * stripeWidth, 0, stripeWidth, height);
  }
}
