color cream=#FCFBE3;
color darkBrown=#9F642C;
color middleBrown=#BC8542;
color lightBrown=#DDCAAA;
color white=#FFFFFF;

color selectedColor;

float slideY=30;

float lineSize=0;
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
rect(350,50,300,200);
}

//slide----------------------------
void slide(float y){
fill(255,0,0);
line(20,30,20,350);
circle(20,y,30);
//lineSize=map(y, 30,350, 0,100);
}
//draw----------------------------
void mouseDragged(){
pushStyle();
strokeWeight(lineSize);
line(pmouseX,pmouseY,mouseX,mouseY);
popStyle();
}
//moveSlide-----------------------------------------
void mousePressed(){
if(mouseY>30 && mouseY<350 && mouseX<50 && mouseX>10){
slideY=mouseY;
lineSize=map(slideY, 30,300, 0,30);
}

}

void mouseReleased(){
 if(dist(100,100,mouseX,mouseY)<26) {
   selectedColor=cream;
 }
 if(dist(100,200,mouseX,mouseY)<26) {
   selectedColor=lightBrown;
 }
 if(dist(100,300,mouseX,mouseY)<26) {
   selectedColor=middleBrown;
 }
}

//all button-----------------------
void button1(){
circleButton(100,100,cream);
//
//rectTactile(100,200);
rectButton(50,170,lightBrown);
//
circleButton(100,300,middleBrown);

stroke(0);
}

//rectbutton-----------------
void rectButton(float x, float y, color z){
  if( mouseX>x && mouseX<x+100 && mouseY>y-48 && mouseY<y+48) {
   stroke(white);
 }
 else {
   stroke(0);
 }
fill(z);
rect(x,y,100,50);
}
//cicleButton--------------------
void circleButton(float x, float y, color z){
  if(dist(x,y,mouseX,mouseY)<26) {
   stroke(white);
 }
 else {
   stroke(0);
 }
fill(z);
ellipse(x,y,50,50);
}

void back(){
fill(200);
rect(0,0,200,400);
}
