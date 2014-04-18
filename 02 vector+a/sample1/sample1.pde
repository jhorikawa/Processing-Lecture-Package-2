int[] sample = new int[3];
ArrayList sample2;
ArrayList<Integer> sample3;


void setup(){
  background(255);
  size(500,500);
  
  //initializing
  sample2 = new ArrayList();
  sample3 = new ArrayList<Integer>();
  
  sample[0] = 3324;
  sample[1] = 45345;
  
  sample2.add(3324);
  sample2.add("fasdfa");
  
  sample3.add(453);
  sample3.add(234242);
  sample3.add(453);
  sample3.add(234242);
  sample3.add(453);
  sample3.add(234242);
  sample3.add(453);
  sample3.add(234242);
  
  sample3.remove(1);
  
  println(sample3.size());
  //println(sample3);
}

void draw(){
  
}
