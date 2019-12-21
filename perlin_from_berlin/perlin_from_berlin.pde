float xoff, yoff;
int dotscale = 15;
int object_size = 24;
float rotation;

void setup(){
  size(720, 720, P3D);
}
void draw(){
  background(255);
  rotateX(rotation);
  //translate(width/1.5, height/1.5);
  for (int i = 0; i < object_size; i++){
    float xpos = drawdot(width, xoff, i * 1000);
    float ypos =  drawdot(height, xoff, i + 1 * 100);
    float xpos2 = drawdot(width, xoff, i + 10 * 1000);
    float ypos2 =  drawdot(height, xoff, i + 15 * 100);
    float dotsize = xpos / dotscale;
    float c_color = rendercolor(xpos, ypos, xpos2, ypos2);
    
    fill(255, c_color);
    stroke(0, c_color);
    ellipse(xpos, ypos, dotsize, dotsize);
    ellipse(xpos2, ypos2, dotsize, dotsize);
    line(xpos, ypos, xpos2, ypos2);
  }
  xoff += 0.001;
  //drawdot(dotsize, xoff, yoff);  
  //saveFrame("/Users/celestin/Desktop/output/portrait/gif-pt-"+nf(counter,4)+".png");
  //counter++;
  //if (counter == totalFrames)
    //exit();
  
}

float drawdot(int screensize, float xoff, int delta){
  float value;
  
  value = screensize * noise(xoff + delta);
  return(value);
}

float rendercolor(float xpos, float ypos, float xpos2, float ypos2){
  float value;

  value = sqrt(sq(xpos2-xpos) + sq(ypos2-ypos));
  value = map(value, width / 5, width / 2, 0, 100);
  return(value);
}
