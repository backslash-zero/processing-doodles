  
import processing.sound.*;
SoundFile file;

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "/Users/cmeunier/Downloads/sleep on the plane.wav");
  file.play();
}      

void draw() {
}
