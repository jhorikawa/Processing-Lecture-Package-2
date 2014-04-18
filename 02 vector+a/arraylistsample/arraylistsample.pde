ArrayList sampleList1;
ArrayList<Integer> sampleList2;

void setup(){
  sampleList1 = new ArrayList();
  sampleList1.add(32);
  
  sampleList2 = new ArrayList<Integer>();
  sampleList2.add(45);
  
  line(0,0,(Integer)sampleList1.get(0),sampleList2.get(0));
}

void draw(){
}
