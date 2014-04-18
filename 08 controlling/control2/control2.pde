import controlP5.*;
ControlP5 controlP5;

int ang = 30;
int len = 50;
String txt ="";

void setup(){
  size(700,500);
  //smooth();
  stroke(0);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("angle",0,180,ang,20,40,100,10);
  controlP5.addSlider("length",0,255,len,20,60,100,10);
}

void draw(){
  background(255);
  fill(0);
  rect(0,0,200,height);
  //calling drawTree subroutine
  line(0,0,100,330);
  drawTree(200+(width-200)/2,height,new PVector(0,-mouseX));
}

//making a subroutine to draw 2D Tree
//parameter x stands for the x position of the starting point of the branch
//parameter y stands for the y position fo the starting point of the branch
//parameter branch used for calculating the length and direction(angle) of the branch
void drawTree(float x, float y, PVector branch){
  stroke(0);
  //setting the condition to activate the command only if the branch size is bigger than 10
  if(branch.mag()>10){
    //make new PVector using the parameter x and y
    PVector ps = new PVector(x,y);
    //make another PVector copying the previous vector.
    PVector pe = ps.get();
    //add branch vector to copied vector to move the vector to the endpoint of the branch.
    pe.add(branch);
    //draw line between start point and end point.
    line(ps.x,ps.y,pe.x,pe.y);
    
    //make a new PVector copied from the branch vector
    PVector br1 = branch.get();
    //scale down the branch length. this is important since branch's length has to be less than 10 sometime to exit the subroutine using the condition
    br1.mult(0.75);
    //rotate the vector using custom rotation function. seems like the PVector.rotate() func doesn't work on mac.
    br1 = ROT(br1,radians(ang));
    //call yourself with new parameter. use endpoint of the previous branch as the new starting point and feed the br1 as the new branch info.
    drawTree(pe.x,pe.y,br1);
    
    //make another branch with different angle
    PVector br2 = branch.get();
    br2.mult(0.75);
    br2 = ROT(br2,radians(-ang));
    drawTree(pe.x,pe.y,br2);
  }
}

//custom rotation function
PVector ROT(PVector p,float ang){
  PVector pr = new PVector(p.x*cos(ang)-p.y*sin(ang),p.x*sin(ang)+p.y*cos(ang));
  return pr;
}


void angle(int val){
  ang = val;
}

void length(int val){
  len = val;
}

