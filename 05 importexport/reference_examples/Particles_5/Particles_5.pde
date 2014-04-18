//variable to hold one object
ParticleEngine engine;
Particle lastParticle;
Particle dragging;
Table backupTable;
//TwitterFactory tf;
//Twitter twitter;
String errorText = "";

PFont font;
PFont errorFont;

void setup() {
  size(1024,768);
  frameRate(50);
  //tf = new TwitterFactory();
  //twitter = tf.getInstance();
  //create a particle engine
  engine = new ParticleEngine();
  smooth();
  font = loadFont("Verdana-Bold-14.vlw");
  errorFont = loadFont("Verdana-Bold-20.vlw");
  textFont(font);
  
  engine.addParticle(new Particle("milosora", random(0, 350), random(0, 350), 0, 0));
  backupTable = new Table("following.tsv");
  //try {
    //IDs ids = twitter.getFriendsIDs("milosora");
    for(int i = 0; i < 33/*ids.getIDs().length*/; i++) {
      String name = backupTable.getString(i,0);
      //String name = twitter.showUser(ids.getIDs()[i]).getScreenName();
      println(name);
      Particle p = new Particle(name, random(0, 350), random(0, 350), 0, 0);
      p.setColor(color(random(0,255),random(0,255),random(0,255)));
      engine.addParticle(p);
      engine.connectParticles(name, "milosora");
    }
  //} catch(TwitterException e) {
    //println("Error: "+e);
  //}
  
  engine.findParticle("milosora").pin(width/2, height/2);
}

void draw() {
  //update the particles
  engine.update();
  //clear the background
  background (0);
  //show error text
  fill(255,0,0);
  textFont(errorFont);
  text(errorText, 15, 15);
  textFont(font);
  //draw the particles
  engine.draw();
}

void mousePressed() {
  if (mouseEvent.getButton()==MouseEvent.BUTTON3) {
    Particle p =  engine.particleAt(mouseX, mouseY);
    if(p!=null) {
      if(!p.isPinned()) p.pin(p.getX(),p.getY());
      else p.unPin();
    }
  } else if (mouseEvent.getClickCount()==2) {
    /*Particle p =  engine.particleAt(mouseX, mouseY);
    if(p!=null && p.getLabel() != "milosora") {
      try {
        errorText = "";
        IDs ids = twitter.getFriendsIDs(p.getLabel());
        for(int i = 0; i < ids.getIDs().length; i++) {
          if(i > 35) break;
          String name = twitter.showUser(ids.getIDs()[i]).getScreenName();
          println(i + ": " + name);
          if(engine.findParticle(name) == null) {
            Particle temp = new Particle(name, random(0, 350), random(0, 350), 0, 0);
            temp.setColor(color(random(0,255),random(0,255),random(0,255)));
            engine.addParticle(temp);
            engine.connectParticles(name, p.getLabel());
          } else if(!name.equals("milosora")) {
            engine.connectParticles(name, p.getLabel());
          }
        }
      } catch(TwitterException e) {
        println("Error: "+e);
        errorText = "Error: Too many requests! Please wait a while before retrying.";
      }
    }*/
  } else {
    dragging = engine.particleAt(mouseX, mouseY);
    if (dragging!=null) {
      dragging.dragged = true;
      lastParticle = dragging;
    }
  }
}

void mouseReleased() {
  if (dragging!=null) {
    dragging.dragged=false;
    dragging = null;
  }
}
  
