String lines[];

void setup(){
  size(500,500);
  background(255);
  lines = loadStrings("sample.txt");
  //println(lines);
  for(int i = 0; i<lines.length; i++){
    float splitLine[] = float(split(lines[i],','));
    println(splitLine);
    
    fill(255,0,0);
    ellipse(splitLine[0],splitLine[1],40,40);
  }
}

void draw(){
  
}
