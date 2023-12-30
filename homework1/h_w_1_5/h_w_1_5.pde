float[] heights;
void setup() {
 size(400, 200); //400*200 사이즈의 모니터를 만듬
 smooth();   //곡선을 그릴때 생기는 깨짐 현상을 해결
}

void draw() {
 background(255);  // 흰색 바탕으로 채움
 float e = 2.71828183;   // 자연 상수 지정                    
 float[] heights = new float[width];  //각 x축 값에 따라 높이 값을 지정할 수 있도록 배열 지정         
 float m = 0;  //상수             
 float sd = map(mouseX,0,width,0.4,2); //mouseX가 될 수 있는 값을 0.4부터 2가 되도록 보정
 for (int i = 0; i < heights.length; i++) { // 각 높이 별로 작업을 시행
   float xcoord = map(i,0,width,-3,3); //xcoord의 값을 -3부터 3부터 재배열 
   float sq2pi = sqrt(2*PI);  //루트 2PI            
   float xmsq = -1*(xcoord-m)*(xcoord-m); // exp의 지수의 분자를 나타내는 값
   float sdsq = sd*sd;        // exp의 지수의 분모를 나타내는 값          
   heights[i] = (1 / (sd * sq2pi)) * (pow(e, (xmsq/sdsq)));  // x축 값 별 함수 값을 저장(정규분포 형태)
 }

 stroke(0); //선의 색깔
 strokeWeight(2); // 선의 굵기
 noFill(); //vertex로 그은 선 내부 영역 색칠하지 않기
 beginShape(); // vertex 지정 시작

 for (int i = 0; i < heights.length-1; i++) {
   float x = i;
   float y = map(heights[i], 0, 1, height-2, 2); // 값이 화면에 잘 맞도록 보정해서 표시
   vertex(x, y);
 }
 endShape();// 꺾은 선 그래프 형태로 vertex를 이용하여 잇기
}
