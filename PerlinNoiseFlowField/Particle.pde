class Particle {

  PVector pos, vel;
  PVector force;
  float maxForce;
  float maxSpeed;
  PVector previousPos;

  Particle (float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    force = new PVector(0, 0);
    maxSpeed = 2;
    previousPos = new PVector(0, 0);
  }

  void Display () {
    stroke(255, 2);
    strokeWeight(1);
    line(previousPos.x, previousPos.y, pos.x, pos.y);
  }

  void AddForce (PVector f) {
    force.add(f);
  }

  void Update () {
    UpdatePrevious();
    vel.add(force);
    vel.limit(maxSpeed);
    pos.add(vel);
    force.mult(0);
  }

  void Follow (PVector[][] flowfield) {
    int x = floor(pos.x/size);
    int y = floor(pos.y/size);
    if (x >= width/size) x = width/size - 1;
    if (x < 0) x = 0;
    if (y >= height/size) y = height/size - 1;
    if (y < 0) y = 0;
    AddForce(flowfield[x][y]);
  }

  void UpdatePrevious () {
    previousPos.x = pos.x;
    previousPos.y = pos.y;
  }

  void Edge () {
    if (pos.x > width) { 
      pos.x -= width;
      previousPos.x -= width;
    }
    if (pos.x < 0) { 
      pos.x += width;
      previousPos.x += width;
    }
    if (pos.y > height) { 
      pos.y -= height;
      previousPos.y -= height;
    }
    if (pos.y < 0) { 
      pos.y += height;
      previousPos.y += height;
    }
  }
}
