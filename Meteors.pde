class Meteor{
  float radius;
  //based of the center
  PVector loc; 
  //end of tail?
  PVector tail; 
  PVector vel;
  PVector accel; 
  PVector gravity;
  float mass;
  float brightness;
  float momentum = 10;
  
  public Meteor(PVector start, float mass, float brightness){
    this.loc = start; 
    this.mass = mass;
    //generate velocity 
    //want it to go down and to the left
    float vel = momentum / mass;
    this.vel = new PVector(-3, vel);
    //acceleration should pull it down
    accel = new PVector(0, 0.5);  
  }
  
  public void update(){
    vel = PVector.add(vel, accel);
    loc = PVector.add(loc, vel);
    
  }
   
}
