void setup(){
  size(400,400);
  
  //sampleSubroutine();
  
  //println(sampleFunction());
  
  //sampleSubroutine2(100);
  
  //println(sampleFunction2(100));
}

void draw(){
  
}

void sampleSubroutine(){
  int s = 100;
  s = s+50;
  println(s);
}

int sampleFunction(){
  int s = 100;
  s = s+50;
  
  return s;
}

void sampleSubroutine2(int s){
  s = s+50;
  println(s);
}

int sampleFunction2(int s){
  s = s+50;
  
  return s;
}
