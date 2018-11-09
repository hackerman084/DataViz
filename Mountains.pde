class Mountain{
 float minHeight; 
 float maxHeight; 
 float x = 0; 
 float y = minHeight; 
 
 public Mountain(float min, float max){
  this.minHeight = min; 
  this.maxHeight = max; 
  float amp1 = 10; 
  float amp2 = 7; 
  float freq1 = 0; 
  float freq2 = 0.7;
  float y_prev = minHeight; 
  
  for(int i = 0; i < width; i+=4){
    float noise = (noise(i, amp1) - 0.5) * 2;
    y = map(amp1*sin(i+freq1), -amp1*PI, amp1*PI, maxHeight, minHeight);
    y += noise; 
    line(x, y_prev, i, y);
    y_prev = y;
    x = i;
    
   
 }
 
}
}

class Mountains{
 ArrayList<Mountain> range = new ArrayList<Mountain>(); 
 
  
}
