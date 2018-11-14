class Mountain{
 float minHeight; 
 float maxHeight; 
 float x = 0; 
 float y = minHeight; 
 
 public Mountain(float min, float max){
  this.minHeight = min; 
  this.maxHeight = max;
  float freq = random(0.01,0.025);
  int octaves = (int) random(3,5);
  float falloff = 0.5;
  float offset = random(200);
  fill(255,0,0,10);
  beginShape();
  noiseDetail(octaves, falloff);
  for(int i = 0; i < width; i+=2){
   float s = sin(radians(i*0.25) + offset)*300;
   float y1 = noise(i*freq)*500-250;
   float y = s+noise((i + offset)*freq)*200-100;
    y = map(y, 0, height, maxHeight, minHeight);
    vertex(i,y);
  }
  //adding other vertices to close it off
  vertex(width,y);
  vertex(width,height);
  vertex(0,height);
  endShape(CLOSE);
}

}

class Mountains{
 ArrayList<Mountain> range = new ArrayList<Mountain>(); 
 
  
}
