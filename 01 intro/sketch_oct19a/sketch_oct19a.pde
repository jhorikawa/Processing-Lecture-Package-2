int num;
float numf;
String tex;
int[] nums = new int[5]; 
float[] floats = new float[3];
String[] ssss = new String[3];

void setup(){
  size(400,400);
  /*
  numf = 10;
  tex = "abcdefg";
  
  nums[0] = 10;
  nums[1] = 11;
  nums[2] = 553;
  nums[3] = 65;
  nums[4] = 8;
  
  nums[0] = nums[0] +10;
  
  println(nums);
  */
}

void draw(){
  
  background(255,0,0);
  /*
  strokeWeight(3);
  fill(255);
  stroke(0,0,255);
  ellipse(200+frameCount,200,40,40);
  */
  /*
  for(int i = 0; i<20; i++){
    for(int n = 0; n<20; n++){
      ellipse(20+20*i,20+20*n,10,10);
    }
  }
  */
  println(mouseX);
  
  if((mouseX > 200)||(mouseY < 200)){
    fill(0,255,0);
  }else{
    fill(0,0,255);
  }
  
  ellipse(200,200,100,100);
}

jh@noizarchitects.com
Junichiro Horikawa
