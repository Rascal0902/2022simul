int n=5;
Ball[] b = new Ball[n];

// Global gravity variable
float gravity = 0.1;  
void setup() { 
  size(1000,1000); 
  smooth();
  
  for(int i=0;i<n;i++){
    b[i] = new Ball(random(width),random(height),random(20));
  }
 
} 

void draw() { 
  background(255); 
  
  for(int i=0;i<n;i++){
    b[i].display(i);
  }
 
  for(int i=0;i<n;i++){
    b[i].update(i);
  }

} 
