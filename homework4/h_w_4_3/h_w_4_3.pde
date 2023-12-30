Node[] node = new Node[10];
Line[] lin = new Line[10000];
import java.util.Vector;
ArrayList<Integer> stack = new ArrayList<Integer>();
boolean[] visit = new boolean[10];
Vector<Vector<Integer>> adj = new Vector<Vector<Integer>>(10);
int time=0;
String ans="";
float lineend=0,cnt=0;
void setup(){
  size(1000,500);
  background(255);
  strokeWeight(3);
  textSize(20);textAlign(CENTER);
  for(int i=0;i<10;i++){
    adj.add(new Vector<Integer>());
  }
  node[0]= new Node(100,100,0);
  
  node[1]= new Node(170,80,1);
  node[2]= new Node(100,200,2);
  node[3]= new Node(150,300,3);
  node[4]= new Node(230,200,4);
  node[5]= new Node(400,90,5);
  node[6]= new Node(350,220,6);
  node[7]= new Node(300,350,7);
  lin[0]= new Line(1,5,4);lineend++;
  lin[1]= new Line(1,4,3);lineend++;
  lin[2]= new Line(1,2,5);lineend++;
  lin[3]= new Line(2,3,7);lineend++;
  lin[4]= new Line(3,7,10);lineend++;
  lin[5]= new Line(3,4,2);lineend++;
  lin[6]= new Line(4,6,5);lineend++;
  lin[7]= new Line(5,6,6);lineend++;
  for(int i=0;i<lineend;i++){
    adj.get(lin[i].n1).add(lin[i].n2);
    adj.get(lin[i].n2).add(lin[i].n1);
    }
    update();
    stack.add(1);
}
void draw(){
  if(stack.size()>0 && time%10==0){
    update();
    table();
    int temp=stack.get(stack.size()-1);
    stack.remove(stack.size()-1); 
    if(!visit[temp]){
     visit[temp]=true;
     println(temp);
     ans+= Integer.toString(temp)+"   ";
    int k=adj.get(temp).size();
    for(int i=0;i<k;i++){
      stack.add(adj.get(temp).get(i));}
    } 
  }
  time++;
}
void update(){
  background(255);
  fill(0);stroke(0);text("koistudy 0169",150,30);
  for(int i=0;i<lineend;i++){
    lin[i].display();
  }
  for(int i=1;i<8;i++){
    node[i].display();
  }
}
void table(){
  fill(0);stroke(0);text("visit",530,100);
  for(int i=1;i<8;i++){
    fill(0);stroke(0);text(i,550+i*50,50);
    fill(0);stroke(0);text((visit[i]==false)? 0:1,550+i*50,100);
  }
  textAlign(LEFT);
  text("ans    "+ans,510,150);
  textAlign(CENTER);
}
