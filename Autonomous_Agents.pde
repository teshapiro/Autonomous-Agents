//Autonomous Agents
//6/5/20
//Elliot Shapiro

Vehicle vehicle;

void setup()
{
  size(700,700);
  frameRate(25);
  smooth(8);
  
  vehicle = new Vehicle(width/2,height/2);
}

void draw()
{
  background(255);
  vehicle.seek(new PVector(mouseX,mouseY));
  vehicle.update();
  vehicle.display();
}
