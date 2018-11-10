//Tree a;
//float rotFactor;
//int i = 0;
//MeteorShower b ;
//Mountain c;
Constellation co;
void setup() {
  //a = new Tree(); 
  background(0);
  size(600, 600, P2D);
  randomSeed(20);
  noiseSeed(20);
  ////fullScreen(P2D);

  //a.theta = map(width/3, 0, width, 0, PI/2);
  ////The first branch starts at the bottom of the window.
  //pushMatrix(); ll
  //translate(width/2, height/2);
  //stroke(0);
  //a.addBranches(height/8,a.theta,0);
  //a.render();

  ////a.branch(height/8, 0);
  //popMatrix();
  //rotFactor = 0.02; 
  //background(0);
  //b = new MeteorShower();
  //c = new Mountain(height,height/2);
  //Mountain d = new Mountain(height, 2*height/3); 
  co = new Constellation(new PVector(width/2, height/2));
}

void draw() {
    background(0);

    //c = new Mountain(height,height/2);
      co.update(2);
      co.render();

    //noLoop();
  //b.initShower();
  //b.render();
  //noLoop(); 
}
