import controlP5.*;
ControlP5 controlP5;

float colR = 100;
float r = 50;
String txt ="";
int posY = 250;

void setup(){
  size(700,500);
  noStroke();
  smooth();
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("red",0,255,20,40,100,10);
  controlP5.addSlider("size",0,255,20,60,100,10);
  
  controlP5.addTextfield("texting",20,80,120,20);
  
  controlP5.addButton("pos",posY,20,120,60,20);
}

void draw(){
  background(255);
  fill(0);
  rect(0,0,200,height);
  
  fill(colR,0,0);
  ellipse(200+(width-200)/2,posY,r,r);
  
  textSize(24);
  text(txt,250,height-50);
}


void red(float val){
  colR = val;
}

void size(float val){
  r = val;
}

void texting(String val){
  txt = val;
}

void pos(int val){
  posY = (int)random(height);
}
