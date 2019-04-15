/**
 * Load and Display an OBJ Shape. 
 * 
 * The loadShape() command is used to read simple SVG (Scalable Vector Graphics)
 * files and OBJ (Object) files into a Processing sketch. This example loads an
 * OBJ file of a rocket and displays it to the screen. 
 */

ArrayList particles;

PShape rocket;
int iteraciones = 2;
float ry;
float a = 2;
int once = 1;
PImage glowImage;


public void setup() {
  //fullScreen() ;
  size(1366, 768, P3D);
  particles = new ArrayList();  
  rocket = loadShape("rocket.obj");  
}

public void draw() 
{
 
  background(0);
  lights();
  translate(width/2, height/2 + 100, -200);
  rotateZ(PI);
  rotateY(ry);
  int children = rocket.getChildCount();
  
  if (once ==0)
  {  
    for (int i = particles.size() - 1; i >= 0; i-- )    
    {
    Particle p = (Particle) particles.get(i);    
    p.run();
    //p.gravity();
    p.display();
    if ((p.x > mouseX - 50 ) && (p.x < mouseX + 50 )  && (p.y > mouseY - 50 ) && (p.y < mouseY + 50 )) 
    {
      println("me toca");
      p.gravity();
    }
   }
  }
  //shape(rocket);
 
  for (int i = 0; i < children; i++) {
    PShape child = rocket.getChild(i);
    int total = child.getVertexCount();
  
    // Now we can actually get the vertices from each child
    for (int j = 0; j < total-1; j++) {
      PVector v1 = child.getVertex(j);
      PVector v2 = child.getVertex(j+1);

      // Cycling brightness for each vertex
      stroke(200,(100+i)%255,(i)%255);
      // Just a dot for each one
      point(v1.x, v1.y,v1.z);
     // point((v2.x+v1.x)/(2),(v2.y+v1.y)/(2),(v2.z+v1.z)/(2));
    //  point((v2.x+v1.x)/(3),(v2.y+v1.y)/(3),(v2.z+v1.z)/(3));
     dottedLine(v1.x, v1.y, v1.z, v2.x, v2.y, v2.z,a);
      
    }
    
  }
  if(once>0)
    {     
    once = 0;
    }
  println( rocket.getChildCount());
  ry += 0.02;

 //   filter(BLUR,1);
}

void dottedLine(float x1, float y1, float z1,float x2, float y2, float z2,float steps)
{
  for(int k=0; k<=steps; k++) 
  {
   float x = lerp(x1, x2, k/steps);
   float y = lerp(y1, y2, k/steps);
   float z = lerp(z1, z2, k/steps);
   point(x, y,z);  
   if (once>0) 
      {
        particles.add(new Particle(x,y,z));
      }
   //noStroke();
   //ellipse(x, y,2,2);
 }
}
