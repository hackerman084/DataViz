class Meteor{
  float radius; //based on user's followers count 
  //based of the center
  PVector loc; 
  //end of tail?
  PVector tail; 
  PVector vel;
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
    float vel = map(momentum / mass, 0, 50, 0, 7);

    if ((momentum / mass) > 50){
      vel = 5;
    }
    System.out.println("MOMENTUM: " + vel);

    this.vel = new PVector(-1.5, vel);
    //acceleration should pull it down
    this.brightness = brightness; 
  }
  
  public void update(){
    loc = PVector.add(loc, vel);
    
  }
  
  public void render(){
    //for now, just doing opacity
    //System.out.println("LOC: " +loc);
    //fill(255,brightness);
    fill(255, 0,0);
    ellipse(loc.x, loc.y, radius, radius);
  }
   
}
