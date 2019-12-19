int cols, rows;
int scl = 20;
int w = width * 20;
int h = height * 20;
int dist = 75;
float flying = 0;
float tetha;
int counter = 0;
int totalFrames = 600;
float[][] terrain;

public void settings() {
  size(640, 640, "processing.opengl.PGraphics3D");
}

void setup(){
  cols = w / scl;
  rows = h / scl;
  terrain = new float [cols][rows];
}
void draw(){
  
  flying += 0.1;
  tetha +=0.01;
  
  float yoff = flying;
  for (int y = 0; y < rows; y++){
    float xoff = 0;
    for (int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff, yoff), 0 , 1, -dist, dist);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
  
  background(255);
  stroke(0);
  fill(255);
  
  translate(width/2, height/2);
  rotateX(PI/2.5 * sin(2 * sin(tetha + 2)));
  rotateY(PI/10 * sin(tetha));
  rotateZ(PI/15 * cos(tetha));
  
  translate(-w/2, -h/2);
  for (int y = 0; y < rows - 1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
  //saveFrame("/Users/cmeunier/goinfre/output/gif-square-"+nf(counter,4)+".png");
  //counter++;
  //if (counter == totalFrames)
    //exit();
}
