int n = 5;
int x;
int y;
float FillColor;
 
void setup() {
  size(400,400);
  background(255);
  smooth();
  noStroke();
  colorMode(HSB, 255);
  x=width;
  y=height;
  triangle(x/2, 0, 0, y, x, y);
  myTriangle(x/2, 0, 0, y, x, y, n);
  loop();
  frameRate(72);
}
 
void draw() {
  // clear the screen
  background(255);
  // change the colour - adjust as required
  // if you want it to repeat I think you'll also need 
  // to reset once the value goes out of bounds...
  FillColor += 1;
  if(FillColor>255){
  FillColor = 0;
}
  // redraw myTriangle with updated colour
  myTriangle(x/2, 0, 0, y, x, y, n);
}
 
void myTriangle(float x1, float y1, float x2, float y2, float x3, float y3, int n) {
  // 'n' is the number of iteration.
  if ( n > 0 ) {
    fill(FillColor, 255/n, 255);
    triangle(x1, y1, x2, y2, x3, y3);
 
    // Calculating the midpoints of all segments.
    float h1 = (x1+x2)/2.0;
    float w1 = (y1+y2)/2.0;
    float h2 = (x2+x3)/2.0;
    float w2 = (y2+y3)/2.0;
    float h3 = (x3+x1)/2.0;
    float w3 = (y3+y1)/2.0;
 
    // Trace the triangle with the new coordinates.
    myTriangle(x1, y1, h1, w1, h3, w3, n-1);
    myTriangle(h1, w1, x2, y2, h2, w2, n-1);
    myTriangle(h3, w3, h2, w2, x3, y3, n-1);
  }
}
