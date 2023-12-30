PVector[] nodexy = new PVector[10000];
class Edge { //정점과 선분 표시
  int start, end, len;
  PVector pos;
  color c = color(0,0,0);
  boolean open;
  
  Edge(int s, int e, int l) {
    start = s;
    end = e;
    len = l;
    open = true;
    if(nodexy[e].x==0 && nodexy[e].y==0){
      pos = new PVector(random(width-width/4), random(height-height/4));
      nodexy[e]=pos;
    }
    else{
      pos = nodexy[e];
    }
  }
  void printEdge() {
    println("(" + start + ", " + end + ", " + len + ")");
  }
  void drawEdge() {
    pos=nodexy[end];
    if(end!=1){
    fill(c);
    ellipseMode(CENTER);
    ellipse(pos.x, pos.y, 30,30);
    fill(255);
    text(nf(end,0,0), pos.x-4, pos.y+5);}
    else
    {
     fill(255,0,0);
     ellipseMode(CENTER);
     ellipse(pos.x, pos.y, 30,30);
     fill(255);
     text(nf(end,0,0), pos.x-4, pos.y+5);
    }
  }
}
void mouseDragged(){
  PVector mouse = new PVector(mouseX,mouseY);
  for(int i=0;i<nodes;i++){
    if(mouse.dist(nodexy[i])<15){
       nodexy[i]=mouse;
    }
  }
}
