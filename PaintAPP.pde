color cream=#FCFBE3;
color darkBrown=#9F642C;
color middleBrown=#BC8542;
color lightBrown=#DDCAAA;
color white=#FFFFFF;

color selectedColor;

float slideY=350;

void setup(){
  size(700,400);
}

void draw(){
stroke(0);
background(166);
//select 
back();

//slide
slide(slideY);
//button
button1();

//drawBoard
fill(selectedColor);
rect(350,50,300,200);
}

void mousePressed(){
if(mouseY>30 && mouseY<350){
slideY=mouseY;
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
//slide----------------------------
void slide(float y){
fill(255,0,0);
line(20,30,20,350);
circle(20,y,30);
}

//all button-----------------------
void button1(){
circleTactile(100,100);
circleButton(100,100,cream);
//
rectTactile(100,200);
rectButton(50,170,lightBrown);
//
circleTactile(100,300);
circleButton(100,300,middleBrown);

stroke(0);
}

void rectTactile(float x, float y){
if( mouseX>x-48 && mouseX<x+48 && mouseY>y-48 && mouseY<y+48) {
   stroke(white);
 }
 else {
   stroke(0);
 }
}

void circleTactile(float x, float y){
if(dist(x,y,mouseX,mouseY)<26) {
   stroke(white);
 }
 else {
   stroke(0);
 }
}

void rectButton(float x, float y, color z){
fill(z);
rect(x,y,100,50);
}

void circleButton(float x, float y, color z){
fill(z);
ellipse(x,y,50,50);
}

void back(){
  fill(200);
rect(0,0,200,400);
}
