SampleClass sample;

void setup(){
  size(400,400);
  background(255);
  smooth();
  
  sample = new SampleClass(200,140);
  
  //sample.drawRect();
  //sample.drawEllipse();
  //println(sample.calcAddition());
}

void draw(){

}

class SampleClass{
  int s,t;
  
  SampleClass(int _s, int _t){
    s = _s;
    t = _t;
  }
  
  void drawRect(){
    fill(0);
    rect(0,0,s,t);
  }
  
  void drawEllipse(){
    fill(0);
    ellipse(width/2,height/2,s,t);
  }
  
  int calcAddition(){
    int calc = s + t;
    return calc;
  }
}
