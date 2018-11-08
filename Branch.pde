class Branch{
  PVector start; 
  PVector end;
  //control points
  PVector c1; 
  PVector c2; 
  float angle;
  float trans; 
  
  public Branch(PVector start, PVector end, PVector c1, PVector c2, float angle, float trans){
    this.start = start;
    this.end = end; 
    this.c1 = c1; 
    this.c2 = c2; 
    this.angle = angle;
    this.trans = trans;
  }
  
  public void render(){
   strokeWeight(2);
   pushMatrix(); 
   translate(0, trans);
   rotate(radians(angle));
   bezier(start.x, start.y, c1.x, c1.y, c2.x, c2.y, end.x, end.y);
   popMatrix();
  }
  
  public String toString(){
   return "S: "  + start.toString() + "E: " +end.toString() + "C1:  "+c1.toString() + "C2: "+c2.toString() + "Angle: " +angle + " Trans: " + trans; 
  }
  
  
  
  
}
