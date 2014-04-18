PImage myImage;

void setup(){
  size(300,300);
  
  myImage = loadImage("sample.jpg");
}

void draw(){
  background(255);
  image(myImage,0,0);
  loadPixels();
  color c = pixels[mouseY*width+mouseX];
  
  fill(c);
  ellipse(width/2,height/2,40,40);
  
}
