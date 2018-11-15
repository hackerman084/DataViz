class Mountain{
 float minHeight; 
 float maxHeight; 
 float x = 0; 
 float y = minHeight; 
 PShape mount;
 
 public Mountain(float min, float max){
   System.out.println("MAX : " + max + " MIN: " + min);
  this.minHeight = min; 
  this.maxHeight = max;
  float freq = random(0.01,0.025);
  int octaves = (int) random(3,5);
  float falloff = 0.5;
  float offset = random(200);
  mount = createShape();
  mount.beginShape();
  mount.fill(0,255,0);
  noiseDetail(octaves, falloff);
  for(int i = 0; i < width; i+=2){
   float s = sin(radians(i*0.25) + offset)*300;
   float y = s+noise((i + offset)*freq)*200-100;
   //System.out.println("YP: " +y);

    y = map(y, -1*height, height, maxHeight, minHeight);
    //System.out.println("Y: " +y);

    mount.vertex(i,y);
  }
  //adding other vertices to close it off
  mount.vertex(width,y);
  mount.vertex(width,height);
  mount.vertex(0,height);
  mount.endShape(CLOSE);
}

public void render(){
   shape(mount);  
  }
}

class Mountains{
 ArrayList<Mountain> range = new ArrayList<Mountain>(); 
 public Mountains(int num, int minHeight, int maxHeight){
   float interval = (minHeight - maxHeight) / num;
   System.out.println("INT: " +interval);
   for(int i = num; i > 0; i--){
     System.out.println("MIN: " + (minHeight-(i*interval)));
     range.add(new Mountain(minHeight, minHeight-(i*interval)));
   }  
 }
 
 public void render(){
   for(Mountain a : range){
     a.render();
   }
 }
 
 
  
}
