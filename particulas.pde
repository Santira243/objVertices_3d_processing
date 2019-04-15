// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// A simple Particle Class
class Particle {
  
  float x;
  float y;
  float z;
  
  float pwidth;
  float pheight;
  float pz;
  
  float xspeed;
  float yspeed;
  float zspeed;
  float life;
  
  boolean ballform;
  boolean ismulticolor;
 
  
  // Make the Particle
  Particle(float tempX, float tempY, float tempZ) {
    x = tempX;
    y = tempY;
    z = tempZ;
    pwidth = random(2,5);
    pheight =random(2,5);
    pz =random(2,5);
    println("Particula: "+x+" "+y+" "+z);
    xspeed = 0;
    yspeed = 0;
    zspeed = 0;
    life = 355;
    ismulticolor = false;
  }
  
  // Move
  void run() {
    x = x + xspeed;
    y = y + yspeed;
    z = z + zspeed;
  }
  
  // Fall down
  void gravity() {
    yspeed -= 10;
  }
  
  // Stop movin
  void stop() {
    xspeed = 0;
    //yspeed = 0;
    y=y-random(10,100);
    ballform = true;
     
  }
  
  // Ready for deletion
  boolean finished() {
    // The Particle has a "life" variable which decreases.
    // When it reaches 0 the Particle can be removed from the ArrayList.
    life -= 1.0; 
    if (life < 0) return true;
    else return false;
  }
  
  // Show
  void display() {
    // Life is used to fade out the particle as well
    noStroke();
    ballform = true;
    
    
    if (!ballform) {
      //rect(x, y,z, pwidth, pheight,pz, 18);
    } else {
      pushMatrix();
        if (!ismulticolor) { 
         fill(random(95,121),random(127,148),random(155,175),life);
        }else {
          fill(random(0,255),random(0,255),random(0,255),life);
        }
      blendMode(ADD);
      lightSpecular(255, 255, 255);
      noStroke();
      lights();
      translate(x, y, z);
      sphere(2);  
      popMatrix();
      
    }
  

  }
}
