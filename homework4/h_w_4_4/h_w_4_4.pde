import java.util.Queue;
import java.util.ArrayDeque;
Queue<PVector> queue = new ArrayDeque<PVector>();
float[][] dp = new float[1000][1000];
PImage img;
void setup() {
  size(600, 600);
  fill(255, 0, 0);
  img = loadImage ("https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Sunflower_sky_backdrop.jpg/693px-Sunflower_sky_backdrop.jpg");
  image(img, 0, 0);
}
void draw() {
}
void mouseClicked() {
  floodFill(mouseX, mouseY, get(mouseX, mouseY), 92);
}
void keyPressed() {
  image(img, 0, 0);
}
void floodFill(int xSeed, int ySeed, color c_selected, int sensitivity) {
  queue.add(new PVector(xSeed,ySeed));
  while(true){
    if(queue.size()==0){break;}
    PVector temp= queue.peek().copy();
    queue.remove();
    if(temp.x>=0 && temp.x<width && temp.y>=0 && temp.y<height && dp[(int)temp.x][(int)temp.y]==0){
      dp[(int)temp.x][(int)temp.y]=1;
      if(colorDist(get((int)temp.x,(int)temp.y),c_selected)<sensitivity){
      fill(255,0,0);noStroke();
      rect(temp.x,temp.y,1,1);
      temp.add(new PVector(1,0));  queue.add(temp.copy()); temp.add(new PVector(-1,0));
      temp.add(new PVector(-1,0)); queue.add(temp.copy()); temp.add(new PVector(1,0));
      temp.add(new PVector(0,1)); queue.add(temp.copy()); temp.add(new PVector(0,-1));
      temp.add(new PVector(0,-1)); queue.add(temp.copy()); temp.add(new PVector(0,1));
      }
    }
    else{
      continue;
    }
  }
  println("finish");
}
float colorDist(color c1, color c2) {
  return dist(red(c1), green(c1), blue(c1), red(c2), green(c2), blue(c2));
}
