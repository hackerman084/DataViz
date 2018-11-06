import java.util.HashSet; 
class Tree {
  PVector wind; 
  float theta;
  HashSet<Float> set = new HashSet<Float>();
  void branch(float len, float rotScale) {
    //arc(0, 0, 2*len, len*2, radians(135), radians(270));
    strokeWeight(len*0.1);
    set.add(len);
    bezier(0,0,24,-63,-20,-50,0,-len);
    translate(0,-len);
    len *= 0.85;
    if (len > 25) {
      pushMatrix();
      rotate(theta+rotScale);
      branch(len, rotScale*1.02);
      popMatrix();
      pushMatrix();
      rotate(-theta + rotScale);
      branch(len, rotScale*1.02);
      popMatrix();
    }
  }
  
}
