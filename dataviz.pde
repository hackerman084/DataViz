Tree a;
float rotFactor; 
void setup() {
  a = new Tree(); 
  //size(600, 600, P2D);
  fullScreen(P2D);
  noFill();
  background(255);

  a.theta = map(width/3, 0, width, 0, PI/2);
  //The first branch starts at the bottom of the window.
  pushMatrix(); 
  translate(width/2, height);
  stroke(0);
  System.out.println(height);
  a.branch(height/8, 0);
  popMatrix();
  System.out.println(a.set.size());
  rotFactor = 0.02; 
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height);
  rotFactor += 0.5; 
  if (rotFactor > 5){
    rotFactor = -0.02;
  }
  
  a.branch(height/8, frameCount*0.02);
  popMatrix();
}
