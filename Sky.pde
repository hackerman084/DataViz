class Sky {
  //should have constellations
  //should have stars
  //should have meteors running through it

  ArrayList<Constellation> constellations;
  ArrayList<Star> stars;
  MeteorShower shower; 
  float minHeight; 
  float maxHeight;

  public void initConstellations() {
    //start it in the 
    constellations = new ArrayList<Constellation>();
    for (int i = 0; i < 6; i++) {
      PVector region = new PVector(i * width / 6, random(300));
      sky.add(new Constellation(region));
    }
  }
  public Sky(int numStars, int minHeight, float maxHeight) {
    this.minHeight = minHeight; 
    this.maxHeight = maxHeight; 


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
