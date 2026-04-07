color cream=#FCFBE3;
color darkBrown=#9F642C;
color middleBrown=#BC8542;
color lightBrown=#DDCAAA;
color white=#FFFFFF;

color selectedColor;

float slideY=30;

float lineSize=0;
int wid=40,leng=20;
void setup(){
  size(700,400);
}

void draw(){
stroke(0);
back();

//slide
slide(slideY);
//button
button1();

//drawBoard
fill(selectedColor);
rect(650,0,50,30);
}

//draw----------------------------
void mouseDragged(){
pushStyle();
strokeWeight(lineSize);
stroke(selectedColor);
line(pmouseX,pmouseY,mouseX,mouseY);
popStyle();
}
//select color----------------------------
void mouseReleased(){
 if(mouseX>50 && mouseX<wid+50&&mouseY>0 && mouseY<leng-100) {
   selectedColor=cream;
 }
 if(mouseX>50 && mouseX<wid+50&&mouseY>20 && mouseY<leng-100){
   selectedColor=lightBrown;
 }
 if(mouseX>50 && mouseX<wid+500&&mouseY>40 && mouseY<leng-100) {
   selectedColor=middleBrown;
 }
}

//all button-----------------------
void button1(){
rectButton(50,30,cream,wid,leng);
rectButton(50,50,lightBrown,wid,leng);
rectButton(50,70,middleBrown,wid,leng);
stroke(0);
}

//rectbutton-----------------
void rectButton(float x, float y, color z, int w, int l){
  if( mouseX>x && mouseX<x+w && mouseY>y-30 && mouseY+30<y+l) {
   stroke(white);
 }
 else {
   stroke(0);
 }
fill(z);
rect(x,y-30,w,l);
}

void back(){
fill(200);
rect(0,0,200,400);
}
//slide----------------------------
void slide(float y){
fill(255,0,0);
line(20,30,20,350);
circle(20,y,30);
}
//moveSlide-----------------------------------------
void mousePressed(){
  if(mouseY>30 && mouseY<350 && mouseX<50 && mouseX>10){
  slideY=mouseY;
  lineSize=map(slideY, 30,300, 0,30);
  }
}
