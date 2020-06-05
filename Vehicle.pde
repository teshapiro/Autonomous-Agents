class Vehicle
{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float max_speed;
  float max_force;
  
  float r;
  float scale_factor;
  PVector desired_display;
  PVector steering_display;
  
  Vehicle(float x, float y)
  {
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    max_speed = 10;
    max_force = 0.9;
    
    r = 10;
    scale_factor = 10;
    desired_display = new PVector(0,0);
    steering_display = new PVector(0,0);
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
    
    desired_display = new PVector(desired.x,desired.y);
    
    PVector steering = PVector.sub(desired,velocity);
    steering.limit(max_force);
    
    steering_display = PVector.sub(desired,velocity);
    
    applyForce(steering);
  }
  
  void display()
  {
    push();
      translate(location.x,location.y);
      displayVehicle();
      displaySteering();
      displayDesired();
      displayVelocity();
      displayLocation();
    pop();
  }
  
  void displayVehicle()
  {
    push();
      fill(175);
      stroke(0);
      strokeWeight(2);
      rotate(velocity.heading());
      
      beginShape();
      vertex(2*r,0);
      vertex(-2*r,r);
      vertex(-2*r,-r);
      endShape(CLOSE);
    pop();
  }
  
  void displayLocation()
  {
    push();
      stroke(0);
      strokeWeight(5);
      point(0,0);
    pop();
  }
  
  void displayVelocity()
  {
    push();
      stroke(0,0,255);
      strokeWeight(2);
      rotate(velocity.heading());
      
      float size = velocity.mag()*scale_factor;
      line(0,0,size,0);
      line(size,0,size-5,5);
      line(size,0,size-5,-5);
    pop();
  }
  
  void displayDesired()
  {
    push();
      stroke(255,0,0);
      strokeWeight(2);
      rotate(desired_display.heading());
      
      float size = desired_display.mag()*scale_factor;
      line(0,0,size,0);
      line(size,0,size-5,5);
      line(size,0,size-5,-5);
    pop();
  }
  
  void displaySteering()
  {
    push();
      stroke(0,255,0);
      strokeWeight(2);
      rotate(steering_display.heading());
      
      float size = steering_display.mag()*scale_factor;
      line(0,0,size,0);
      line(size,0,size-5,5);
      line(size,0,size-5,-5);
    pop();
  }
}
