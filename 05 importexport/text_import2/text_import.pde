import peasy.*;

PeasyCam cam;

String lines[];

void setup(){
  size(500,500,P3D);
  noStroke();
  
  cam = new PeasyCam(this, 1000);
  
  lines = loadStrings("points.txt");
}

void draw(){
  background(0);
  lights();
  ambientLight(100,100,100);
  for(int i = 0; i<lines.length; i++){
    float splitLine[] = float(split(lines[i],','));
    pushMatrix();
    translate(splitLine[0],splitLine[1],splitLine[2]);
    fill(map(splitLine[0],0,500,0,255),map(splitLine[1],0,500,0,255),map(splitLine[2],0,500,0,255));
    sphere(map(splitLine[0]+splitLine[1]+splitLine[2],0,1500,0,25));
    popMatrix();
  }
}
