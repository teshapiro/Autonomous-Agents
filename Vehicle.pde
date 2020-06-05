class Vehicle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float max_speed;
  float max_force;
  
  float r;
  
  Vehicle(float x, float y)
  {
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    max_speed = 10;
    max_force = 0.9;
    
    r = 10;
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(max_speed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  void seek(PVector target)
  {
    PVector desired = PVector.sub(target,location);
    desired.normalize();
    desired.mult(max_speed);
    
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(max_force);
    
    applyForce(steer);
  }
  
  void display()
  {
    push();
    
    fill(175);
    stroke(0);
    strokeWeight(2);
    translate(location.x,location.y);
    rotate(velocity.heading());
    beginShape();
    vertex(2*r,0);
    vertex(-2*r,r);
    vertex(-2*r,-r);
    endShape(CLOSE);
    
    strokeWeight(5);
    point(0,0);
    
    pop();
  }
}
