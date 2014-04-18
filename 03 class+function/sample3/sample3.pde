PVector p;
ArrayList lists;
/*
SampleClass sample1;
SampleClass sample2;
SampleClass sample3;
*/

void setup(){
  size(400,400);
  background(255);
  
  p = new PVector();
  lists = new ArrayList();
  for(int i = 0; i<200;i++){
    SampleClass sample = new SampleClass(int(random(width)),int(random(height)));
    lists.add(sample);
  }
  
  for(int i = 0; i<lists.size(); i++){
    SampleClass s = (SampleClass)lists.get(i);
    s.coloring();
    s.update();
  }
  
  /*
  sample1 = new SampleClass(100,100);
  sample2 = new SampleClass(345,233);
  sample3 = new SampleClass(30,200);
  
  sample1.coloring();
  sample1.update();
  
  sample2.coloring();
  sample2.update();
  
  sample3.coloring();
  sample3.update();
  */
}

void draw(){

}

class SampleClass{
  int x;
  int y;
  SampleClass(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  void coloring(){
    fill(map(x,0,width,0,255),map(y,0,height,0,255),255);
  }

  void update(){
    ellipse(x,y,diam(),diam());
  }
  
  int diam(){
    float d = map(x+y,0,500,10,100);
    return int(d);
  }
}

