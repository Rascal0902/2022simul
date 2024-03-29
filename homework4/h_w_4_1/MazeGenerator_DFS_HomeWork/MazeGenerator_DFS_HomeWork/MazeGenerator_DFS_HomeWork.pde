// Depth-first search
// Recursive backtracker
// https://en.wikipedia.org/wiki/Maze_generation_algorithm

int cols, rows;
int w = 20;
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

  current.visited = true;
  current.highlight();
  
  // STEP 1
  Cell next = current.checkNeighbors();
  if (next != null) {
    
    // STEP 2
    
    // STEP 3
    
    // STEP 4
    
  } else if (stack.size() > 0) {
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
