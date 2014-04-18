import peasy.*;

PeasyCam cam;

void  setup(){
  size(500,500,P3D);
  cam = new PeasyCam(this, 400);
  
}

void draw(){
  background(0);
  
  fill(100);
  ambient(100);
  
  pushMatrix();
  translate(100*sin(radians(frameCount)),100*cos(radians(frameCount)),0);
  box(50);
  popMatrix();

  noFill();
  stroke(255);
  strokeWeight(3);
  ellipse(0,0,200,200);
}
