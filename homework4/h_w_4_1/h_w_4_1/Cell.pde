
// Depth-first search
// Recursive backtracker
// https://en.wikipedia.org/wiki/Maze_generation_algorithm

class Cell {
  int i, j;
  boolean[] walls = {true, true, true, true};
  boolean visited = false;
  
  Cell(int ii, int jj) { //ii,jj 생성
    i = ii;
    j = jj;
  }

  Cell checkNeighbors() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();

    Cell top    = grid.get(index(i, j-1));
    Cell right  = grid.get(index(i+1, j));
    Cell bottom = grid.get(index(i, j+1));
    Cell left   = grid.get(index(i-1, j));

    if (top != null && !top.visited) {
      neighbors.add(top);
    }
    if (right != null && !right.visited) {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) {
      int r = floor(random(0, neighbors.size()));
      return neighbors.get(r);
    } else {
      return null;
    }
  }
  
  void highlight() {
    int x = this.i*w;
    int y = this.j*w;
    noStroke();
    fill(0, 0, 255, 100);
    rect(x, y, w, w);

  }

  void show() {
    int x = this.i*w;
    int y = this.j*w;
    stroke(255);
    fill(255);stroke(255);
    if (this.walls[0]) { //위
      line(x,y,x+w,y);
    }
    if (this.walls[1]) { //왼
      line(x,y,x,y+w);
    }
    if (this.walls[2]) { //아래
      line(x,y+w,x+w,y+w);
    }
    if (this.walls[3]) { //오
      line(x+w,y,x+w,y+w);
    }

    if (this.visited) {
      noStroke();
      fill(255, 0, 255, 100);
      rect(x, y, w, w);
    }
  }
}
