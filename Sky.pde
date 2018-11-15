class Sky {
  //should have constellations
  //should have stars
  //should have meteors running through it

  ArrayList<Constellation> constellations;
  ArrayList<Star> stars;
  MeteorShower shower;  //have access to array of meteors
  float minHeight; 
  float maxHeight;
  float dist; 

  public void initConstellations() {
    constellations = new ArrayList<Constellation>();
    for (int i = 0; i < 6; i++) {
      PVector region = new PVector(i * width / 6, random(300));
      constellations.add(new Constellation(region));
    }
  }

  public void updateConstellations() {
    //System.out.println("SIZE: "+constellations.size());
    for (int i = 0; i < constellations.size(); ) {
      Constellation a = constellations.get(i);
      //if it's near the edge, spawn a new one in the list
      if (a.constellation.size() == 0) {
        constellations.remove(a);
      } else {
        if (width - a.loc.x < 50 && constellations.size() < 6) {
          //System.out.println("ADD: " +i);
          constellations.add(new Constellation(new PVector(0, random(minHeight, maxHeight))));
        }
        i++;
        a.update(dist);
      }
    }
  }

  public void renderConstellations() {
    for (Constellation a : constellations) {
      a.render();
    }
  }

  public Sky(int numStars, int minHeight, float maxHeight, float dist) {
    this.minHeight = minHeight; 
    this.maxHeight = maxHeight; 
    this.dist = dist;

    initStars(numStars);

    shower = new MeteorShower();
    ////initializing the tweets
    shower.initShower();

    initConstellations();
  }

  public void initStars(int numStars) {
    stars = new ArrayList<Star>();
    //use noise to try and initialize a few star clusters
    for(int i = 0; i < numStars; i++){
     float x = random(width); 
     float y = random(minHeight, maxHeight);
     float noise = noise(x, y);
     stars.add(new Star(new PVector(x, y), noise*7, noise*200));
    }
    
  }


  public void updateSky() {
    shower.initShower();
    updateConstellations();
    shower.update();
    for (int i = 0; i < shower.meteors.size(); i++) {
      Meteor a = shower.meteors.get(i); 
      for (int j = 0; j < stars.size(); j++) {
        Star b = stars.get(j);
        //float d = PVector.dist(a.loc, b.center);
        float d = dist(mouseX, mouseY, b.center.x, b.center.y);
        float falloff = 1.0/(d/24);
        float illumination = map(falloff, 1, 0, 255, 0);
        //fill(illumination);
        b.brightness = illumination; 
        b.render();
      }
    }
  }


  public void renderSky() {
    for (Constellation a : constellations) {
      a.render();
    }

    for (Star a : stars) {
      a.render();
    }
    
    shower.render();
  }
}
