public class Spring {
  
  color col;
  
  // a reference to the engine
  private ParticleEngine engine;
  
  //the two particles the spring is connected too
  public Particle start;
  public Particle end;
  
  //spring length and constant
  public float springLength;
  public float springConstant;
   // flag to indicate whether or not the spring is destroyed
  public boolean destroyed;
  
  public Spring(Particle start, Particle end, float springLength, float springConstant) {
    this.start = start;
    this.end = end;
    this.springLength = springLength;
    this.springConstant = springConstant;
    col = color(255);
  }
  
  public void setEngine(ParticleEngine engine) {
    this.engine = engine;
  }
  
  public void update() {
    //use pythagoras to calculate distance between the particles
    float dx = end.x - start.x;
    float dy = end.y - start.y;
    float d = sqrt(dx * dx + dy * dy);
    //normalize the distance vector
    if (d>0){
      dx /= d;
      dy /= d;
    }
    //apply spring length and constant
    d -= springLength;
    d *= springConstant;
    
    //apply force on the particles
    start.velocityX += d*dx;
    start.velocityY += d*dy;
    end.velocityX -= d*dx;
    end.velocityY -= d*dy;
  }
  
  public void draw() {
    noFill();
    stroke(col);
    strokeWeight(2);
    line(start.x, start.y, end.x, end.y);
  }
  
  public void setColor(color col) {
    this.col = col;
  }
}
