
int size;
float incr, timeIncr;
float spread;
float zoff;

Particle[] particle = new Particle[1000];

PVector[][] flowfield;

void setup () {
  fullScreen(P2D);
  //size(1600, 900, P2D);
  background(10);
  size = 10;
  incr = sqrt(2) / 27;
  timeIncr = sqrt(2) / 270;
  spread = .1;
  zoff = 0;
  for (int i=0; i<particle.length; i++) {
    particle[i] = new Particle(random(width), random(height));
  }
  flowfield = new PVector[width/size][height/size];
}

void draw () {
  float xoff = 0;
  for (int i=0; i<width/size; i++) {
    float yoff = 0;
    for (int j=0; j<height/size; j++) {
      float angle = noise(xoff, yoff, zoff) * 2 * PI * 2;
      PVector dir = new PVector(cos(angle), sin(angle));
      dir.setMag(spread);
      flowfield[i][j] = dir;
      yoff += incr;
    }
    xoff += incr;
  }
  zoff += timeIncr;

  for (int i=0; i<particle.length; i++) {
    particle[i].Follow(flowfield);
    particle[i].Update();
    particle[i].Edge();
    particle[i].Display();
  }
}

void mousePressed() {
  save("screenshots/screenshot.png");
  exit();
}
