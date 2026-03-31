color cream=#FCFBE3;

void setup(){
  size(700,400);
}

void draw(){
button1();
}

void button1(){
button(150,100,cream);
button(150,200,cream);
button(150,300,cream);



}


void button(float x, float y, color z){
fill(z);
ellipse(x,y,50,50);

}
