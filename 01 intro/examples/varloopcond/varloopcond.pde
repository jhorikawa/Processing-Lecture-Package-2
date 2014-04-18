int num = 20;
float s = 12;
float ran = 3;
float d = 80;

void setup(){
  size(500,500);
  smooth();
  frameRate(25);
}  

void draw(){
  background(0);
  
  for(int i = 1; i<num; i++){
    for(int n = 1; n<num; n++){
      stroke(255);
      strokeWeight(2);
      float rad;
      float distance = sqrt(sq(mouseX-i*(500/num))+sq(mouseY-n*(500/num)));
      
      if(distance<d){
        rad = map(sqrt(sq(mouseX-i*(500/num))+sq(mouseY-n*(500/num))),0,d,40,s)+random(-ran,ran);
        fill(map(distance,0,d,255,0),0,0,150);
      }else{
        rad = s+random(-ran,ran);
        fill(map(i,1,num, 0,255),map(n,1,num,0,255),100);
      }
      ellipse(i*(500/num),n*(500/num),rad,rad);
    }
  }
}
