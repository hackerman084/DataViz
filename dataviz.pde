Tree a;
float rotFactor;
int i = 0;
void setup() {
  a = new Tree(); 
  size(600, 600, P2D);
  //fullScreen(P2D);

  a.theta = map(width/3, 0, width, 0, PI/2);
  //The first branch starts at the bottom of the window.
  pushMatrix(); 
  translate(width/2, height/2);
  stroke(0);
  a.addBranches(height/8,a.theta,0);
  a.render();

  //a.branch(height/8, 0);
  popMatrix();
  rotFactor = 0.02; 
}

void draw() {
  
    
  
  
}