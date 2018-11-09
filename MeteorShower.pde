class MeteorShower {
  ArrayList<Meteor> shower; 
  TwitterAccess t; 
  
  public MeteorShower() {
    t = new TwitterAccess();
    shower = new ArrayList<Meteor>();
  }

  public void initShower() {
    try{
      for (Status a : t.getTweets()) {
        shower.add(createMeteor(a));
      }
      t.clearTweets();
    }
    catch(ConcurrentModificationException e){
      System.out.println("Concurrent Mod exception");
    }
    
  }
  
  public void addShower(){
    
  }

  public void render() {
    for (int i = 0; i < shower.size(); ) {
      Meteor a = shower.get(i);

      if (a.loc.y + a.radius > height) {
        shower.remove(a);
      } else {
        a.update();
        a.display();
      }
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
    println(tweet.getText());
    return new Meteor(new PVector(width, 0), mass, bright, r);
  }
}
