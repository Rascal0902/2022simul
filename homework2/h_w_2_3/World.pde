/*
 * Jonghwa Park
 * suakii@gmail.com
*/
class World {

  ArrayList<Agent> agents;   

  World(int num) {
    agents = new ArrayList<Agent>();              
    for (int i = 0; i < num; i++) {
      PVector l = new PVector(random(width),random(height));
      agents.add(new red_blood_cell(l));
    }
  }

  void born(float x, float y) {
    float ran=random(4);
    for(int i=0;i<5;i++){
       PVector l = new PVector(x,i*160);
       if(ran>=1){agents.add(new red_blood_cell(l));}
       else{agents.add(new white_blood_cell(l));}
    }
    for(int i=0;i<5;i++){
       PVector l = new PVector(i*160,y);
       if(ran>=1){agents.add(new red_blood_cell(l));}
       else{agents.add(new white_blood_cell(l));}
    }
  }

  void run() {
    
    for (int i = agents.size()-1; i >= 0; i--) {
      Agent a = agents.get(i);
      a.run();
      if (a.dead()) {
        agents.remove(i);
      }
    }
  }
  
}
