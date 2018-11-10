class Constellation{
  ArrayList<Star> constellation = new ArrayList<Star>(); 
  
  
}

class Star{
 float radius; 
 float brightness; 
 PVector center; 
 
 public Star(PVector center, float radius, float brightness){
   this.center = center; 
   this.radius = radius; 
   this.brightness = brightness;
 }
  
}
