class Constellation{
  ArrayList<Star> constellation = new ArrayList<Star>(); 
  
  public Constellation(PVector region){
    //want it to spontaneously form around the region
    int size = (int) random(5,7);
    int dist = (int) random(width/7, 2*width/7);
    PVector loc = null; 
    for(int i = 0; i < size; i++){
      loc = new PVector(random(region.x-dist, region.x+dist),random(region.y-dist, region.y+dist) );
      constellation.add(new Star(loc, random(5,15)));
    }
  }
  
  public void update(float dist){
    for(int i = 0; i < constellation.size();){
      Star a = constellation.get(i); 
      a.update(dist); 
      if (a.radius + a.center.x > width ) {
        constellation.remove(a);
      }
      else {
        i++;
      }
    } 
  }
  public void render(){
    stroke(255);
    
    for(int i = 1; i < constellation.size();i++){
      Star a = constellation.get(i); 
      Star b = constellation.get(i-1);
      a.display();
      b.display();
      stroke(255, (a.brightness + b.brightness) / 2);
      line(a.center.x, a.center.y, b.center.x, b.center.y);
      }
      
    } 
}

class Star{
 float radius; 
 float brightness; 
 PVector center; 
 float ratio = 500;
 public Star(PVector center, float radius){
   this.center = center; 
   this.radius = radius; 
   brightness = 2*ratio / radius; //inversely proportionate
 }
 
 //handles movement and twinkle
 public void update(float dist){
   center = PVector.add(center, new PVector(dist,0));
   float twinkle = random(0,1);
   if (twinkle > 0.5){
    brightness+=10;  
   }
   else {
    brightness-= 10;  
   } 
 }
 
 public void display(){
   fill(255, brightness);
   noStroke();
   ellipse(center.x, center.y, radius, radius);
 }
  
}
