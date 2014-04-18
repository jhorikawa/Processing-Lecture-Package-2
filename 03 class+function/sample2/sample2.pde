int d;
void setup(){
  size(400,400);
  int a = 14;
  int b = 32;
  int c = 22;
  
  //sample1(a,b,c);
  d = sample2(a,b,c);
  ellipse(width/2,height/2,d,d);
}

void sample1(int r, int g, int t){
  int s = r+g+t;
}

int sample2(int r, int g, int t){
  int s = r+g+t;
  return s;
}
