class Mountain{
 float minHeight; 
 float maxHeight; 
 float x = 0; 
 float y = minHeight; 
 
 public Mountain(float min, float max){
  this.minHeight = min; 
  this.maxHeight = max; 
  float amp1 = 15; 
  float freq1 = 2;
  float y_prev = maxHeight; 
  
  for(int i = 0; i < width; i+=7){
    amp1 = random(15,25);   
    float noise = (noise(i, amp1, y_prev) - 0.5);
    float up = random(0,1); 
    System.out.println(y);
    if (up > 0.5){
      System.out.println("WTF " +amp1*sin(radians(i)));
      y = y_prev + amp1*sin(radians(freq1*i));
    }
    else {
      System.out.println("WTF " +noise* amp1*sin(radians(i*freq1)));

      y = y_prev - amp1*sin(radians(i));
    }
    y += (noise * 0.5); 
    line(x, y_prev, i, y);
    y_prev = y;
    x = i;
 
 }
 
}
}

class Mountains{
 ArrayList<Mountain> range = new ArrayList<Mountain>(); 
 
  
}
