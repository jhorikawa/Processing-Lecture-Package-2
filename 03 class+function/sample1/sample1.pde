void setup(){
  size(400,400);
  //sampleSubroutine(120,234,"sample");
  println(sampleFunction2(2.5));
}

void draw(){
}

void sampleSubroutine(int n, int i, String s){
  n = n + i;
  println(s +";"+ n);
}

float sampleFunction(float num){
  float i = 100*num;
  return i;
}

int sampleFunction2(float num){
  float i = 100*num;
  return int(i);
}
