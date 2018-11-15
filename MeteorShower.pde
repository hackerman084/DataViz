class MeteorShower {
  ArrayList<Meteor> meteors; 
  TwitterAccess t; 
  
  public MeteorShower() {
    t = new TwitterAccess();
    meteors = new ArrayList<Meteor>();
  }

  public void initShower() {
    try{
      for (Status a : t.getTweets()) {
        //System.out.println("STATUS: " +a.getText());
        //System.out.println("INIT: " +meteors.size());
        if (meteors.size() < 10){
          meteors.add(createMeteor(a));
        }
      }
      t.clearTweets();
    }
    catch(ConcurrentModificationException e){
      System.out.println("Concurrent Mod exception");
    }
    
  }
  
  public void update(){
    for (int i = 0; i < meteors.size(); ) {
      Meteor a = meteors.get(i);

      if (a.loc.y + a.radius > height || a.loc.x + a.radius < 0) {
        meteors.remove(a);
      } else {
        a.update();
        i++;
      }
    }
    
  }
  public void render() {
    //System.out.println("METEORS: " +meteors.size());
    for(Meteor a : meteors){
        a.render();
    }
  }

  public Meteor createMeteor(Status tweet) {
    User user = tweet.getUser();// getting user
    float followersCount = user.getFollowersCount();
    float retweetCount = tweet.getRetweetCount();
    //PVector start, float mass, float brightness, float radius
    float mass = map(followersCount, 0, 10000, 0, 60);
    float bright = map(retweetCount, 0, 10000, 0, 200);
    float r = map(followersCount, 0, 10000, 5, 20);
    //tweets.remove(0);
    //println("CREATE: "+ tweet.getText());
    return new Meteor(new PVector(noise(followersCount, retweetCount) * width, 0), mass, bright, r);
  }
}
