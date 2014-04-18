BigBall bigball;
ArrayList bigballs;
SmallBalls smallballs;

void setup(){
  size(600,600);
  smooth();
  
  //initialize position vector
  
  smallballs = new SmallBalls(5,1);
  
  
  bigball = new BigBall(new PVector(random(width),random(height)), new PVector(random(-10,10),random(-10,10)),5,30);
  
  for(int i = 0; i<250; i++){
    smallballs.addBall(new PVector(random(width),random(height)));
  }
}

void draw(){
  fill(0,30);
  rect(0,0,width,height);
  
  smallballs.update();
  bigball.update();
  
}

class SmallBalls{
  ArrayList smallBalls;
  int minVel;
  int maxVel;
  
  SmallBalls(int _minVel,int _maxVel){
    smallBalls = new ArrayList();
    minVel = _minVel;
    maxVel = _maxVel;
  }
  
  void addBall(PVector p){
    smallBalls.add(p);
  }
  
  void update(){
    if(keyPressed && (key == 'r' || key == 'R')){
      randomMove();
    }else{
      mouseFollow();
    }
    separate(15);
    render();
  }
  
  void separate(int sepDist){
     for(int i = 0; i<smallBalls.size(); i++){
        PVector pos = (PVector)smallBalls.get(i);
        for(int n = 0; n<smallBalls.size(); n++){
          if(i != n){
            PVector other = (PVector)smallBalls.get(n);
            float dis =pos.dist(other);
            if(dis < sepDist){
              PVector ballVel = new PVector();
              ballVel.add(pos);
              ballVel.sub(other);
              ballVel.normalize();
              ballVel.mult(minVel);
              pos.add(ballVel);
            }
          }
        }
     }
  }
  
  void mouseFollow(){
    for(int i = 0; i<smallBalls.size(); i++){
      PVector pos = (PVector)smallBalls.get(i);
      PVector ballVel = new PVector();
      ballVel.add(bigball.pos);
      ballVel.sub(pos);
      ballVel.normalize();
      ballVel.mult(map(bigball.pos.dist(pos),0,sqrt(sq(width)+sq(height)),minVel,maxVel));
      pos.add(ballVel);
    }
  }
  
  void randomMove(){
    for(int i = 0; i<smallBalls.size(); i++){
      PVector pos = (PVector)smallBalls.get(i);
      PVector randVel = new PVector(random(-10,10),random(-10,10));
      pos.add(randVel);
    }
  }
  
  void render(){
    for(int i = 0; i<smallBalls.size(); i++){
      PVector pos = (PVector)smallBalls.get(i);
      
      float dis = pos.dist(bigball.pos);
      fill(map(dis,0,(width+height)/2,0,255),120,map(dis,0,(width+height)/1.5,255,0));
      noStroke();
      ellipse(pos.x,pos.y,map(dis,0,width,8,1),map(dis,0,(width+height)/2,8,1));
    }
  }
}



class BigBall{
  PVector pos;
  PVector vel;
  int minVel;
  int maxVel;
  color c;
  
  BigBall(PVector _pos, PVector _vel,int _minVel, int _maxVel){
    pos = _pos;
    vel = _vel;
    minVel = _minVel;
    maxVel = _maxVel;
  }
  
  void update(){
    border();
    mouseFollow();
    render();
  }
  
  void render(){
    fill(c);
    noStroke();
    ellipse(pos.x,pos.y,20,20);
  }
  

  
  void mouseFollow(){
    //initialize mouse vector
    PVector mos = new PVector(mouseX,mouseY);
    
    //mouse affection
    if(mousePressed == true){
      PVector mosVel = new PVector();
      mosVel.add(mos);
      mosVel.sub(pos);
      mosVel.normalize();
      mosVel.mult(map(mos.dist(pos),0,sqrt(sq(width)+sq(height)),minVel,maxVel));
      pos.add(mosVel);
      vel = mosVel;
      
      c = closestColor();//color(255,255,0,150);
      
    }else if(keyPressed == true && key == ' '){
      flee();
    }else{
      pos.add(vel);
      
      c = closestColor();//color(255,0,0,150);
    }
  }
  
  color closestColor(){
    float closestDist = 99999999;
    for(int i = 0; i<smallballs.smallBalls.size(); i++){
      PVector smallBall = (PVector)smallballs.smallBalls.get(i);
      
      float ballDist = pos.dist(smallBall);
      
      if(ballDist < 100){
        stroke(255,50);
        line(pos.x,pos.y,smallBall.x,smallBall.y);
      }
      
      if(ballDist < closestDist){
        closestDist = ballDist;
      }
    }
    return color(map(closestDist,0,30,255,0),map(closestDist,0,30,0,255),map(closestDist,0,30,0,255));
  }
  
  void flee(){
    float closestDist = 99999999;
    int closestNum = -1;
    for(int i = 0; i<smallballs.smallBalls.size(); i++){
      PVector smallBall = (PVector)smallballs.smallBalls.get(i);
      
      float ballDist = pos.dist(smallBall);
      
      if(ballDist < 100){
        stroke(255,255,0,50);
        line(pos.x,pos.y,smallBall.x,smallBall.y);
      }
      
      if(ballDist < closestDist){
        closestDist = ballDist;
        closestNum = i;
      }
    }
    
    if((closestDist > 10)&&(closestDist < 70)){
      PVector fleeVel = new PVector();
      fleeVel.add(pos);
      fleeVel.sub((PVector)smallballs.smallBalls.get(closestNum));
      fleeVel.normalize();
      fleeVel.mult(10);
      pos.add(fleeVel);
    }else{
      pos.add(vel);
    }
    
    c = color(255,255,0);
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
}
