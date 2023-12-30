// Depth-first search
// Recursive backtracker
// https://en.wikipedia.org/wiki/Maze_generation_algorithm

int cols, rows;
int w = 20;
float out=0,no=0;
ArrayList<Cell> grid = new ArrayList<Cell>();

Cell current;

ArrayList<Cell> stack = new ArrayList<Cell>();

void setup() {
  size(600, 600);
  cols = floor(width/w);
  rows = floor(height/w);
  //frameRate(5);

  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      Cell cell = new Cell(i, j);
      grid.add(cell);
    }
  }

  current = grid.get(0);
  stack.add(current);
  noLoop();
}

void mousePressed() {
  loop();
}

void draw() {
  background(51);
  for (int i = 0; i < grid.size(); i++) {
    grid.get(i).show();
  }
  if(stack.size()>0){current=stack.get(stack.size()-1);}
  current.visited = true;
  current.highlight();
  
  Cell next = current.checkNeighbors();
  if (next != null) {
    if(!next.visited)
    {
      if(next.i==current.i+1){next.walls[1]=false;current.walls[3]=false;}
      else if(next.i==current.i-1){next.walls[3]=false;current.walls[1]=false;}
      else if(next.j==current.j+1){next.walls[0]=false;current.walls[2]=false;}
      else {next.walls[2]=false;current.walls[0]=false;}
      if(out==1){no++;}
      stack.add(next);
    }
  } 
  else if (stack.size() > 0) {

    if(current.i==rows-1 && current.j==cols-1){out=1;}
    if(no==0 && out==1){current.R=0;current.G=255;current.B=0;}
    if(no>0){no--;}
     current = stack.remove(stack.size()-1);
  }
}

int index(int i, int j) {
  if (i < 0 || j < 0 || i > cols-1 || j > rows-1) {
    return 0;
  }
  return i + j * cols;
}



void removeWalls(Cell a, Cell b) {
  int x = a.i - b.i;
  if (x == 1) {
    //
  } else if (x == -1) {
   //
  }
  int y = a.j - b.j;
  if (y == 1) {
   //
  } else if (y == -1) {
    //
  }
}
