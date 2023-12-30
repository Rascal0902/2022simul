import java.util.Comparator;
import java.util.PriorityQueue;
import java.util.ArrayDeque;
import java.util.Vector;
public class MyComparator implements Comparator<PVector>{
  public int compare (PVector s1, PVector s2){
    return (s1.x < s2.x)? 1 : 0;  // 작은걸 올린다.
  }
}
PriorityQueue<PVector> pq = new PriorityQueue<PVector>(new MyComparator());
Vector<Vector<PVector>> adj2 = new Vector<Vector<PVector>>(10);
float[] distance = new float[10];


class Solver {
  int nodeCount;
  ArrayList<Edge> graph;
  
  Solver(int nc) {
    nodeCount = nc;
    graph = new ArrayList<Edge>();
  }
  
  void addEdge(Edge edge) {
    graph.add(edge);
  }
  
  void outputGraph() {
    println("Nodes: " + nodeCount);
    println("Graph");
    
    for (Edge edge : graph)
      edge.printEdge();
  }
  
  void solve(int start) {
    pq.add(new PVector(0,start));
    while(pq.size()>0){
    PVector temp=pq.peek();
    pq.remove();
    
    if(distance[(int)temp.y]<=temp.x){continue;}
     distance[(int)temp.y]=temp.x;
     println(temp,distance[0],distance[1],distance[2],distance[3],distance[4]);
     
    int k=adj2.get((int)temp.y).size();
    for(int i=0;i<k;i++){   //for
      pq.add(new PVector(adj2.get((int)temp.y).get(i).x+temp.x,adj2.get((int)temp.y).get(i).y));
    }
  }
  }
  
  
  
}
