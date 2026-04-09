color white=#FFFFFF, black=#000000;
color lightGray = #D3D3D3;color darkGray = #444444;
color warmGray = #E8E4D8;color coolGray = #B0BEC5;color darkCharcoal = #2E2E2E;

color red = #E63946;color lightRed = #FF6B6B;color darkRed = #A4161A;
color orange = #F77F00;color lightOrange = #FFB703;color darkOrange = #C05600;
color yellow = #FFD60A;color lightYellow = #FFF3B0;color darkYellow = #C9A000;
color green = #2A9D8F;color lightGreen = #8FD3A9;color darkGreen = #1B7F6B;
color mutedGreen = #7A8F6B;color leaf = #4CAF50;color moss = #6B8E23;color lightSage = #C9D4C5;
color blue = #3A86FF;color lightBlue = #90CAF9;color darkBlue = #1D4ED8;
color dustyBlue = #6B7C8F;color sky = #87CEEB;color ocean = #1CA3EC;
color purple = #8338EC;color lightPurple = #CDB4DB;color darkPurple = #5A189A;
color softGold = #E6C068;color paleYellow = #F5E6A9;color softTerracotta = #C97B63; 
color skinLight = #FAD2C9;color skinMid = #E0AC69;color skinDark = #8D5524;
color brown = #8B5E3C;color sand = #EED9C4;
//allColor------------------------------------------------
color selectedColor;

float slideY=30;

float lineSize=0;
int wid=40,leng=20;
int x=50,y=0;
int row1=x;// row2=x+wid,row3=row2+wid,row4=row3+wid,row5=row4+wid,row6=row5+wid,row7=row6+wid,row8=row7+wid,row9=row8+wid,row10=row9+wid;
int col1=y,col2=col1+leng, col3=col2+leng, col4=col3+leng, col5=col4+leng, col6=col5+leng, col7=col6+leng, col8=col7+leng, col9=col8+leng, col10=col9+leng; 
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
 select(row1,col1,red,lightRed,darkRed);//1
 select(row1,col2,orange,lightOrange,darkOrange);//2
 select(row1,col3,yellow,lightYellow,darkYellow);//3
 select(row1,col4,green,lightGreen,darkGreen);//4
 select(row1,col5,mutedGreen,leaf,moss);//5
 select(row1,col6,blue,lightBlue,darkBlue);//6
 select(row1,col7,dustyBlue,sky,ocean);//7
 select(row1,col8,purple,lightPurple,darkPurple);//8
 select(row1,col9,softGold,paleYellow,softTerracotta);//9
 select(row1,col10,skinLight,skinMid,skinDark);//10
}
//all button-----------------------
void button1(){
  rectButton(row1,col1,red,lightRed,darkRed);//1
  rectButton(row1,col2,orange,lightOrange,darkOrange);//2
  rectButton(row1,col3,yellow,lightYellow,darkYellow);//3
  rectButton(row1,col4,green,lightGreen,darkGreen);//4
  rectButton(row1,col5,mutedGreen,leaf,moss);//5
  rectButton(row1,col6,blue,lightBlue,darkBlue);//6
  rectButton(row1,col7,dustyBlue,sky,ocean);//7
  rectButton(row1,col8,purple,lightPurple,darkPurple);//8
  rectButton(row1,col9,softGold,paleYellow,softTerracotta);//9
  rectButton(row1,col10,skinLight,skinMid,skinDark);//10
  stroke(0);
}
//rectbutton-----------------
void rectButton(float x, float y, color a,color b,color c){
    bu(x,y,a);
    bu(x+wid,y,b);
    bu(x+wid*2,y,c);
}
//------------------
void bu(float x,float y, color a){
 if( mouseX>x && mouseX<x+wid && mouseY>y && mouseY<y+leng) {
       stroke(white);
     }
     else {
       stroke(0);
     }
    fill(a);
    rect(x,y,wid,leng);
}
//--------------
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
//selectedColor---------------------------------------------
void select(int x,int y,color a,color b, color c){
  se(x,y,a);
  se(x+wid,y,b);
  se(x+2*wid,y,c);
 }
 //
 void se(int x,int y,color a){
   if(mouseX>x && mouseX<wid+x&&mouseY>y && mouseY<leng+y) {
     selectedColor=a;
   }
 }
 //finish---------------------------------
