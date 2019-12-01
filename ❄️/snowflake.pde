int xspacing = 10;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
int linedelta = 40;
int lineammount = 1;
int dotdivider = 5;
int newlinedelta = linedelta / lineammount / 2;
int counter = 0;
int totalFrames = 500;

void setup() {
  size(640, 640);
  w = width + xspacing;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw() {
  background(255);
  calcWave();
  renderWave();
  maskTrace();
  text();
  saveFrame("/tmp/output/giv-"+nf(counter,4)+".png");
  counter++;
  if (counter == totalFrames)
  {
    exit();
  }
}

void text() {
  PFont mono;
  mono = createFont("PT Mono", 32);
  int widthDivider = 50;
  int locationText = -(width/2) + width/widthDivider;
  fill(0);
  textFont(mono);
  textSize(width / widthDivider);
  text("frame:  "+nf(counter,3), locationText, locationText + widthDivider/4); 
}

void maskTrace(){
  fill(255);
  translate(width /2, height /2);
  for( float a = 0; a < 360; a+=1){
    pushMatrix();
    rotate( radians(a) );
    ellipse( width/2, height/2, width*0.75, height*0.75);
    popMatrix();
  }
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.05;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(0);
  // A simple way to draw the wave with an ellipse at each location

  for (int o = 0; o <= lineammount; o++) 
  {
    for (int x = 0; x < yvalues.length; x++) 
    {
      for (int delta = -linedelta; delta < linedelta; delta++)
      {
        if (delta%2 == 0)
        {
          ellipse(x*xspacing + o * newlinedelta, height/2+yvalues[x] + xspacing * delta, xspacing/dotdivider, xspacing/dotdivider);
        }
        else
        {
          ellipse(x*xspacing + o * newlinedelta + xspacing/2, height/3+yvalues[x] + xspacing * delta, xspacing/dotdivider, xspacing/dotdivider);
        }
      }
    }
  }

}
