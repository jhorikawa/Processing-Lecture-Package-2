void setup(){
  size(500,500);
}

void draw(){
  //background(255);
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  
  fill(255,255,0);
  ellipse(width/2+100*sin(radians(frameCount*2)),height/2+100*cos(radians(frameCount*2)),30,30);
}
