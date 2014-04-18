void setup(){
  size(500,500);
  smooth();
  background(255);
  
  fill(255,0,0);
  rect(0,0,100,100);
  
  pushMatrix();
  
  translate(200,200);
  rotate(radians(30));
  scale(1.2);
  fill(255,255,0);
  rect(0,0,100,100);
  
  popMatrix();
  
  fill(0,0,255);
  rect(0,0,50,50);
}
  
void draw(){
  //background(255);
  
  
}
