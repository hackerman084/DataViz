class Meteor{
  float radius; //based on user's followers count 
  //based of the center
  PVector loc; 
  //end of tail?
  PVector tail; 
  PVector vel;
  PVector accel; 
  PVector gravity;
  float mass; // based on the the popularity of the user? 
  float brightness; //based on the popularity of the tweet itself (retweet count)
  float momentum = 10;
  
  public Meteor(PVector start, float mass, float brightness, float radius){
    this.loc = start; 
    this.mass = mass;
    this.radius = radius;
    //generate velocity 
    //want it to go down and to the left
    float vel = momentum / mass;
    this.vel = new PVector(-3, vel);
    //acceleration should pull it down
    accel = new PVector(0, 0.5);  
    this.brightness = brightness; 
  }
  
  public void update(){
    vel = PVector.add(vel, accel);
    loc = PVector.add(loc, vel);
  }
  
  public void display(){
    //for now, just doing opacity
    fill(255, brightness);
    ellipse(loc.x, loc.y, radius, radius);
  }
   
}
