//Tree a;
//float rotFactor;
//int i = 0;
//MeteorShower b ;
Mountains field;
  PImage img;
Sky sky;
void setup() {
  //a = new Tree(); 
  //background(0);
  size(800, 600, P2D);
  randomSeed(20);
  noiseSeed(20);
  img = loadImage("sky.png");
  img.resize(width, height);
  background(img);
  sky = new Sky(300,0, 400,2);
  field = new Mountains(3, height, height-400);
  
  ////fullScreen(P2D);

  //a.theta = map(width/3, 0, width, 0, PI/2);
  ////The first branch starts at the bottom of the window.
  //pushMatrix(); 
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
  //sky = new ArrayList<Constellation>();
  //for (int i = 0; i < 6; i++) {
  //  PVector region = new PVector(i * width / 6, random(300));
  //  sky.add(new Constellation(region));
  //}
}


void draw() {
  //background(255);
  background(img);
  //noStroke(); 
  //fill(0, 10);
  //rect(0,0,width,height);
  sky.updateSky();
  sky.renderSky();
  field.render();

  
}
