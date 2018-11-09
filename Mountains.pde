class Mountain{
 float minHeight; 
 float maxHeight; 
 float x = 0; 
 float y = minHeight; 
 
 public Mountain(float min, float max){
  this.minHeight = min; 
  this.maxHeight = max; 
  float amp1 = 10; 
  float amp2 = 5; 
  float freq1 = 0.5; 
  float freq2 = 0.7;
  for(int i = 0; i < width; i+=3){
    if (i%2 == 0){
      y = map((amp1 * sin(i + freq1)), -amp1*PI, amp1*PI, maxHeight, minHeight);
    }
    else{
      //y = map((amp2 * sin(i + freq2)), -amp2*PI, amp2*PI, maxHeight, minHeight);
    }
    ellipse(i,y,5,5);
    
  }
  
  
   
 }
 
}

class Mountains{
 ArrayList<Mountain> range = new ArrayList<Mountain>(); 
 
  
}
