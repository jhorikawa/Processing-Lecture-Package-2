PImage myImage;

void setup(){
  size(350,300);
  
  myImage = loadImage("sample.jpg");
  
}

void draw(){
  background(0);
  image(myImage,0,0);
  loadPixels();
  PVector mos = new PVector(mouseX, mouseY);
  for(int i = 0; i<width; i++){
    for(int n = 0; n<height; n++){
      PVector pos = new PVector(i,n);
      float dis = mos.dist(pos);
      if(dis < 25){
        pixels[int(pos.y)*width+int(pos.x)] = color(int(map(dis,0,50,0,255)),blue(pixels[int(pos.y)*width+int(pos.x)]),green(pixels[int(pos.y)*width+int(pos.x)]));
      }
    }  
  }
  updatePixels();
}
