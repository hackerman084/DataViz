import java.util.HashSet; 
class Tree {
  PVector wind; 
  float theta;
  ArrayList<Branch> branches = new ArrayList<Branch>();
  PrintWriter output;
  
  HashSet<Float> set = new HashSet<Float>();

  void keyPressed() {
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
    exit(); // Stops the program
  }
  void render() {
    output = createWriter("positions.txt"); 
    for (Branch a : branches) {
      a.render();
      output.println(a);
    }
  }
  void branch(float angle, float len, float trans) {
    branches.add( 
      new Branch(new PVector(0, 0), new PVector(24, -63), 
      new PVector(-20, -50), new PVector(0, -len), angle, trans)
      );
    trans += -len;
    len *= 0.85;
    if (len > 25) {
      branch(2*angle, len, trans);
      branch(-2*angle, len, trans);
    }
  }

  void addBranches(float len, float initTheta, float trans) {
    //branch(initTheta, len, trans);
    float[] arr = new float[10];
    arr[0] = -len;
    for(int i = 1; i < 10; i++){
     arr[i] = -1 * Math.abs(arr[i-1]*0.85);
     System.out.println("I: " +arr[i]);
    }
    
    for (int i = 0; i < 511; i++){
      if (i <= Math.pow(2,0)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, -len), initTheta, arr[0])
        ); 
      }
      else if (i <= Math.pow(2,1)){
        float sLen = (float) (-len*Math.pow(0.85, 1));
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, sLen), (float)(initTheta*Math.pow(2,1)), arr[1])
        ); 
      }
      else if (i <= Math.pow(2,2)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 2))), (float)(initTheta*Math.pow(2,2)), arr[2])
        ); 
      }
      else if (i <= Math.pow(2,3)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 3))), (float)(initTheta*Math.pow(2,3)), arr[3])
        ); 
      }
      else if (i <= Math.pow(2,4)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 4))), (float)(initTheta*Math.pow(2,4)), arr[4])
        ); 
      }
      else if (i <= Math.pow(2,5)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 5))), (float)(initTheta*Math.pow(2,5)), arr[5])
        ); 
      }
      else if (i <= Math.pow(2,6)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 6))), (float)(initTheta*Math.pow(2,6)), arr[6])
        ); 
      }
      else if (i <= Math.pow(2,7)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 7))), (float)(initTheta*Math.pow(2,7)), arr[7])
        ); 
      }
      else if (i <= Math.pow(2,8)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 8))), (float)(initTheta*Math.pow(2,8)), arr[8])
        ); 
      }
      else if (i <= Math.pow(2,9)){
        branches.add( 
        new Branch(new PVector(0, 0), new PVector(24, -63), 
        new PVector(-20, -50), new PVector(0, (float) (-len*Math.pow(0.85, 9))), (float)(initTheta*Math.pow(2,9)), arr[9])
        ); 
      }
    }
  }

  //void branch(float len, float rotScale) {
  //  strokeWeight(len*0.1);
  //  set.add(len);
  //  bezier(0, 0, 24, -63, -20, -50, 0, -len);
  //  System.out.println(-len);
  //  translate(0, -len);
  //  len *= 0.85;
  //  if (len > 25) {
  //    System.out.println("Branch: "+rotScale);
  //    if (rotScale < 0.25) {
  //      pushMatrix();
  //      rotate(theta+rotScale);
  //      branch(len, rotScale*1.2);
  //      popMatrix();
  //      pushMatrix();
  //      rotate(-theta + rotScale);
  //      branch(len, rotScale*1.2);
  //      popMatrix();
  //    } else if (rotScale > 0.25) {
  //      pushMatrix();
  //      rotate(theta-rotScale);
  //      branch(len, rotScale*1.2);
  //      popMatrix();
  //      pushMatrix();
  //      rotate(-theta - rotScale);
  //      branch(len, rotScale*1.2);
  //      popMatrix();
  //    }
  //  }
  //}
}
