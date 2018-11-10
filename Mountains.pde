class Mountain{
 float minHeight; 
 float maxHeight; 
 float x = 0; 
 float y = minHeight; 
 
 public Mountain(float min, float max){
  this.minHeight = min; 
  this.maxHeight = max; 
  float amp1 = 5; 
  float freq1 = 0.5;
  float y_prev = maxHeight; 
  float shift = random(-5*width, width*5) * 400;
  for(int i = 0; i < width; i+=random(3,7)){
    amp1 = random(10,25);
    //freq1 = random(0.5,0.6);
    //amp1 = 10;
    float noise = (noise(i, amp1, y_prev));
    //float noise = 1;
    float up = random(0,0.9); 
    System.out.println(y);
    if (up > 0.5){
      System.out.println("WTF " +amp1*sin(radians(i)));
      //y = y_prev + noise(amp1*sin(radians(freq1*i + shift))) * amp1;
      y = map(amp1*sin(radians(freq1*i + shift)), -amp1*PI, amp1*PI, minHeight, maxHeight);
      y += (noise * 2); 

    }
    else {
      System.out.println("WTF " +noise* amp1*sin(radians(i*freq1)));
      //y = y_prev - noise(amp1*sin(radians(freq1*i + shift)))*amp1;
      y = map(amp1*sin(radians(freq1*i + shift)), -amp1*PI, amp1*PI, minHeight, maxHeight);
      y -= (noise * 2); 

    }
    line(x, y_prev, i, y);
    y_prev = y;
    x = i;
 
 }
 
}
}

class Mountains{
 ArrayList<Mountain> range = new ArrayList<Mountain>(); 
 
  
}
