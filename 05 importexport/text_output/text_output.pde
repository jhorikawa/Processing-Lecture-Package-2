PrintWriter output;
PFont myFont;
color c;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  output = createWriter("sample.txt");
  myFont = createFont("Arial",24);
  textFont(myFont);
}

void draw(){
  background(0);
  c = color(255*abs(sin(radians(frameCount))),255*abs(cos(radians(frameCount))),255*abs(tan(radians(frameCount))));
  fill(c);
  ellipse(mouseX,mouseY,30,30);
  fill(255);
  text("x:"+mouseX+", y:"+mouseY,mouseX+30,mouseY+30);
  text("color: R(" + (int)red(c) + ") G(" + (int)green(c) + ") B("+ (int)blue(c)+")",mouseX+30,mouseY+60);
}

void mouseClicked(){
  output.println("__________________________________");
  output.println("x:"+mouseX+", y:"+mouseY);
  output.println("color: R(" + (int)red(c) + ") G(" + (int)green(c) + ") B("+ (int)blue(c)+")");
  output.flush();
}
