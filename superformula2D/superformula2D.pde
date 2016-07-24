//superformula shape from Boris'References : https://www.youtube.com/watch?v=u6arTXBDYhQ
float time;

void setup()
{
  size(800, 800, FX2D);
  smooth(8);
  strokeWeight(1);
  stroke(255);
  noFill();
   background(20);
  
}

void draw()
{
 background(20);
 translate(width/2, height/2);
 rotate(time * 0.1);
  beginShape();
  for(int i=1; i<360; i ++)
  {
    float theta = norm(i, 0, 360) * TWO_PI;
    float rad = radius(theta, 
    noise(time) * 10, //a size
    noise(time) * 10, //b Spiral VARIATION
    6, //m amount of segment on the shape
    noise(time) * 4, //n1 smoothness/spikness ratio
    sin(time) + 0.5, //n2 spikness/smoothness variation of even segment
    cos(time) + 0.5 //n3 spikness/smoothness variation of odd segment
    ) * 100;
    float x = rad * cos(theta);
    float y = rad * sin(theta);
    vertex(x, y);
  }
  endShape(CLOSE);
  
  time += 0.05;
}

float radius(float theta, float a, float b, float m, float n1, float n2, float n3)
{
  return pow(pow(abs(cos(m * theta / 4.0) / a), n2) + pow(abs(sin(m * theta / 4.0) / b), n3), -1.0 / n1);
}