PVector pos;
PVector vel;
PVector mos;
ArrayList balls;

void setup(){
  size(600,600);
  smooth();
  
  pos = new PVector(random(width),random(height));
  vel = new PVector(random(-5,5),random(-5,5));
  
  balls = new ArrayList();
  for(int i = 0; i<200; i++){
    balls.add(new PVector(random(width),random(height)));
  }
  
}

void draw(){
  background(255);
  
  mos = new PVector(mouseX,mouseY);
  
  fill(255,0,0);
  noStroke();
  
  if(pos.x<0){
    pos.x = 0;
    vel.x = -vel.x;
  }
  if(pos.x>width){
    pos.x = width;
    vel.x = -vel.x;
  }
  if(pos.y>height){
    pos.y = height;
    vel.y = -vel.y;
  }
  if(pos.y<0){
    pos.y = 0;
    vel.y = -vel.y;
  }
  
  pos.add(vel);
  ellipse(pos.x,pos.y, 20,20);
  
  
  for(int i = 0; i<balls.size(); i++){
    PVector p = (PVector)balls.get(i);
    
    PVector ballVel = new PVector();
    ballVel.add(pos);
    ballVel.sub(p);
    ballVel.normalize();
    ballVel.mult(3);
    p.add(ballVel);
    
    for(int n = 0; n<balls.size(); n++){
      if(i != n){
        PVector other = (PVector)balls.get(n);
        float dis = p.dist(other);
        if(dis < 10){
          PVector ballVel2 = new PVector();
          ballVel2.add(p);
          ballVel2.sub(other);
          ballVel2.normalize();
          ballVel2.mult(5);
          p.add(ballVel2);
        }
      }
    }
    
    fill(0,0,255);
    noStroke();
    ellipse(p.x,p.y,5,5);
  }
}
