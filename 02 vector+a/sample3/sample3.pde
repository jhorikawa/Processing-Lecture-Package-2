boolean start = false;

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  background(255);
  noStroke();
  if(start == false){
    fill(255,0,0);
  }else{
    fill(0,0,255);
  }
  ellipse(width/2+50*sin(radians(frameCount)),height/2+50*cos(radians(frameCount)),25,25);  
  
  if(start == true){
    saveFrame("sample-####.jpg");
  }
}

void keyPressed(){
  if(key == 's'){
    if(start == false){
      start = true;
    }else{
      start = false;
    }
  }
}
