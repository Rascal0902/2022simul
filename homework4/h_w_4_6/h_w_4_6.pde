String[] file;
int nodes = 0;
int w = 10,h = 10;
int startNode;
Solver graph;
ArrayList<Edge> shortestPath;
void setup(){
  for(int i=0;i<10000;i++){
    nodexy[i]=new PVector(0,0);
  }
  for(int i=0;i<10;i++){
    adj2.add(new Vector<PVector>());
  }
  file = loadStrings("graph.txt");
  startNode = 1;
  size(800,800); 
  smooth();
  graph = new Solver(int(file[0]));
  nodes = graph.nodeCount;
  
  shortestPath = new ArrayList<Edge>();
  
  for(int i = 1; i<file.length; i++){
    String[] Edge = split(file[i], ' ');
    graph.addEdge(new Edge(int(Edge[0]),int(Edge[1]),int(Edge[2])));
    shortestPath.add(new Edge(int(Edge[0]),int(Edge[1]),int(Edge[2])));
    //shortestPath.add(new Edge(int(Edge[1]),int(Edge[0]),int(Edge[2])));
    adj2.get(int(Edge[0])).add(new PVector(int(Edge[2]),int(Edge[1])));
  }
  for(int i=0;i<10;i++){
      distance[i]=1000000000;
  }
  graph.outputGraph();
  long start, end, total;
  start = System.currentTimeMillis();
  println("Solving...");
  graph.solve(startNode);
  end = System.currentTimeMillis();
  total = end - start;
  OutputShortestPath();
  println("Solver took: " + total + " msec to solve the graph."); 
}


void draw(){
 background(255);
 fill(230);
 for(int i = 0; i< shortestPath.size(); i++){
   Edge aEdge = shortestPath.get(i);
   float x1, y1, x2, y2;
   x1 = aEdge.pos.x;
   y1 = aEdge.pos.y;
   x2 = aEdge.pos.x;
   y2 = aEdge.pos.y;
   for(int j=0; j<shortestPath.size(); j++){
     Edge bEdge = shortestPath.get(j);
     if(aEdge.end == bEdge.start){
       x2 = bEdge.pos.x;
       y2 = bEdge.pos.y;
     }
     stroke(0,0,200);
     line(x1,y1,x2,y2); 
   } 
   aEdge.drawEdge();
   fill(0);
   textSize(20);text((int)distance[aEdge.end], x1, y1 + 33);
 } 
   
}

//output textual representation of shortest path.
void OutputShortestPath(){
  println("Node \t Distance");
  for(int i = 0; i< 5; i++){
    println(i + "\t" + distance[i]);
  }
}
