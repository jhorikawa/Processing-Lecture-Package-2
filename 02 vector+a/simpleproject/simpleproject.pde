PVector pos;
PVector vel;
PVector mos;

ArrayList<PVector> balls;

void setup(){
  size(600,600);
  smooth();
  
  //initialize position vector
  pos = new PVector(random(width),random(height));
  vel = new PVector(random(-5,5),random(-5,5));
  
  balls = new ArrayList<PVector>();
  for(int i = 0; i<200; i++){
    balls.add(new PVector(random(width),random(height)));
  }
}

void draw(){
  background(255);
  
  //initialize mouse vector
  mos = new PVector(mouseX,mouseY);
  
  //call border subroutine
  border();
  
  //mouse affection
  if(mousePressed == true){
    PVector mosVel = new PVector();
    mosVel.add(mos);
    mosVel.sub(pos);
    mosVel.normalize();
    mosVel.mult(map(mos.dist(pos),0,sqrt(sq(width)+sq(height)),5,20));
    pos.add(mosVel);
  }else{
    pos.add(vel);
  }
  
  fill(255,0,0);
  noStroke();
  ellipse(pos.x,pos.y,20,20);
  
  for(int i = 0; i<balls.size(); i++){
    PVector p = balls.get(i);
    
    PVector ballVel1 = new PVector();
    ballVel1.add(pos);
    ballVel1.sub(p);
    ballVel1.normalize();
    ballVel1.mult(map(pos.dist(p),0,sqrt(sq(width)+sq(height)),5,1));
    p.add(ballVel1);
    
    for(int n = 0; n<balls.size(); n++){
      if(i != n){
        PVector other = balls.get(n);
        float dis =p.dist(other);
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

void border(){
  if(pos.x > width){
    pos.x = width;
    vel.x = -vel.x;
  }
  if(pos.x<0){
    pos.x = 0;
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
}
