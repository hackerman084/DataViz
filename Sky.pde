class Sky {
  //should have constellations
  //should have stars
  //should have meteors running through it

  ArrayList<Constellation> constellations;
  ArrayList<Star> stars;
  MeteorShower shower; 
  float minHeight; 
  float maxHeight;
  float dist; 
  
  public void initConstellations() {
    constellations = new ArrayList<Constellation>();
    for (int i = 0; i < 6; i++) {
      PVector region = new PVector(i * width / 6, random(300));
      sky.add(new Constellation(region));
    }
  }
  
  public void updateConstellations(){
    for(int i = 0; i < constellations.size(); i++){
       Constellation a = constellations.get(i);
       //if it's near the edge, spawn a new one in the list
       if (width - a.region.x < 20){
         constellations.add(new Constellation(new PVector(0, random(minHeight, maxHeight))));
       }
       a.update(dist);
    }
  }
  
  public void renderConstellations(){
   for(Constellation a : constellations){
    a.render(); 
   }
  }
  
  public Sky(int numStars, int minHeight, float maxHeight, float dist) {
    this.minHeight = minHeight; 
    this.maxHeight = maxHeight; 
    this.dist = dist;

    stars = new ArrayList<Star>();
    //use noise to try and initialize a few star clusters
    for (int x = 0; x < numStars; x+=4) {
      for (int y = minHeight; y < maxHeight; y+=5) {
        float noise = noise(x, y);
        stars.add(new Star(new PVector(x, y), noise*7, noise*200));
      }
    }
    shower = new MeteorShower();
    //initializing the tweets
    shower.initShower();
  }

  public void updateSky() {
  }
}
