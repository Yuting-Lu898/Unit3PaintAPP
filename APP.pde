color white=#FFFFFF,black=#000000;
String fileName="myDrawing.png";
color lightGray=#D3D3D3;color darkGray=#444444;color warmGray=#E8E4D8;color coolGray=#B0BEC5;color darkCharcoal=#2E2E2E;color red=#E63946;color lightRed=#FF6B6B;color darkRed=#A4161A;color orange=#F77F00;color lightOrange=#FFB703;color darkOrange=#C05600;color yellow=#FFD60A;color lightYellow=#FFF3B0;color darkYellow=#C9A000;color green=#2A9D8F;color lightGreen=#8FD3A9;color darkGreen=#1B7F6B;color mutedGreen=#7A8F6B;color leaf=#4CAF50;color moss=#6B8E23;color lightSage=#C9D4C5;color blue=#3A86FF;color lightBlue=#90CAF9;color darkBlue=#1D4ED8;color dustyBlue=#6B7C8F;color sky=#87CEEB;color ocean=#1CA3EC;color purple=#8338EC;color lightPurple=#CDB4DB;color darkPurple=#5A189A;color softGold=#E6C068;color paleYellow=#F5E6A9;color softTerracotta=#C97B63;color skinLight=#FAD2C9;color skinMid=#E0AC69;color skinDark=#8D5524;color brown=#8B5E3C;color sand=#EED9C4;

color selectedColor;
float slideY=30;
PImage allBlack,choose,loadedImg;
boolean active,cleanAct,newAct,loadAct;
float lineSize=1;
int wid=40,leng=20;
float imgx=120,imgy=60;
int x=50,y=0;
int row1=x;
int col1=y,col2=col1+leng,col3=col2+leng,col4=col3+leng,col5=col4+leng,col6=col5+leng,col7=col6+leng,col8=col7+leng,col9=col8+leng,col10=col9+leng;
String ne="Save",cle="Clear",load="Load";

PGraphics canvas;

void setup(){
  size(700,400);
  canvas=createGraphics(500,400);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  allBlack=loadImage("Haka.png");
}

void draw(){
  back();
  image(canvas,200,0);
  stroke(0);
  slide(slideY);
  button1();
  fill(selectedColor);
  rect(650,0,50,30);
  Image(50,200,allBlack);
}

void button1(){
  rectButton(row1,col1,red,lightRed,darkRed);rectButton(row1,col2,orange,lightOrange,darkOrange);rectButton(row1,col3,yellow,lightYellow,darkYellow);rectButton(row1,col4,green,lightGreen,black);rectButton(row1,col5,mutedGreen,leaf,moss);rectButton(row1,col6,blue,lightBlue,darkBlue);rectButton(row1,col7,dustyBlue,sky,ocean);rectButton(row1,col8,purple,lightPurple,darkPurple);rectButton(row1,col9,softGold,paleYellow,softTerracotta);rectButton(row1,col10,skinLight,skinMid,skinDark);
  stroke(0);
  button(60,360,cle);button(60,300,load);button(60,330,ne);
}

void select(int x,int y,color a,color b,color c){
  se(x,y,a);
  se(x+wid,y,b);
  se(x+2*wid,y,c);
  selectBut(60,360,cle);
  selectBut(60,300,load);
  selectBut(60,330,ne);
}

void se(int x,int y,color a){
  if(mouseX>x&&mouseX<wid+x&&mouseY>y&&mouseY<leng+y)selectedColor=a;
}

void selectBut(int x,int y,String a){
  if(mouseX>x&&mouseX<wid+x&&mouseY>y&&mouseY<leng+y){
  if(a==cle)cleanAct=true;
  else if(a==load)loadAct=true;
  else if(a==ne)newAct=true;
  }
  if(cleanAct==true){
    canvas.beginDraw();
    canvas.background(255);
    canvas.endDraw();
    cleanAct=false;
  }
}

void selectImage(int x,int y,PImage a){
  if(mouseX>x&&mouseX<x+wid-5&&mouseY>y&&mouseY<y+leng+15&&active!=true){
    choose=a;
    active=true;
  }else if(mouseX>x&&mouseX<x+wid-5&&mouseY>y&&mouseY<y+leng+15&&active==true){
    active=false;
  }
}

void button(int x,int y,String a){
  if(mouseX>x&&mouseX<x+wid&&mouseY>y&&mouseY<y+leng)stroke(white);
  else stroke(0);
  fill(255);
  rect(x,y,wid,leng);
  fill(0);
  text(a,x+8,y+15);
  stroke(0);
}

void mouseDragged(){
  if(active==false){
    canvas.beginDraw();
    canvas.stroke(selectedColor);
    canvas.strokeWeight(lineSize);
    canvas.line(pmouseX-200,pmouseY,mouseX-200,mouseY);
    canvas.endDraw();
  }else{
    canvas.beginDraw();
    canvas.image(choose,mouseX-270,mouseY-50,180,90);
    canvas.endDraw();
  }
}

void mousePressed(){
  if(mouseY>30&&mouseY<350&&mouseX<50&&mouseX>10){
    slideY=mouseY;
    lineSize=map(slideY,30,300,1,30);
  }
}

void mouseReleased(){
  select(row1,col1,red,lightRed,darkRed);select(row1,col2,orange,lightOrange,darkOrange);select(row1,col3,yellow,lightYellow,darkYellow);select(row1,col4,green,lightGreen,black);select(row1,col5,mutedGreen,leaf,moss);select(row1,col6,blue,lightBlue,darkBlue);select(row1,col7,dustyBlue,sky,ocean);select(row1,col8,purple,lightPurple,darkPurple);select(row1,col9,softGold,paleYellow,softTerracotta);select(row1,col10,skinLight,skinMid,skinDark);
  selectImage(50,200,allBlack);
  
  if(newAct==true){
    selectOutput("Save your image:","saveFile");
    newAct=false;
  }else if(loadAct==true){
    selectInput("Pick an image:","loadFile");
    loadAct=false;
    }
  }
  
void back(){
  fill(200);
  rect(0,0,200,400);
}
  
void slide(float y){
  fill(255,0,0);
  line(20,30,20,350);
  circle(20,y,30);
}

void Image(int x,int y,PImage a){
  int c,d;
  if(mouseX>x&&mouseX<x+wid-5&&mouseY>y&&mouseY<y+leng+15){
    imgx=180;imgy=90;
    fill(255);
    c=150;d=90;
  }else{
    c=wid-8;d=leng+10;
    fill(0);
    imgx=60;imgy=30;
  }
  if(active)stroke(255,0,0);
  rect(x,y,c,d);
  image(a,x-15,y,imgx,imgy);
}

void rectButton(float x,float y,color a,color b,color c){
bu(x,y,a);
bu(x+wid,y,b);
bu(x+wid*2,y,c);
}

void bu(float x,float y,color a){
if(mouseX>x&&mouseX<x+wid&&mouseY>y&&mouseY<y+leng)stroke(white);
else stroke(0);
fill(a);
rect(x,y,wid,leng);
}

void saveFile(File selection){
  if(selection==null){
    println("Save cancelled");
  }else{
    canvas.save(selection.getAbsolutePath());
    println("Saved to:"+selection.getAbsolutePath());
  }
}

void loadFile(File selection){
  if(selection==null){
    println("Load cancelled");
  }else{
    loadedImg=loadImage(selection.getAbsolutePath());
    if(loadedImg!=null){
      canvas.beginDraw();
      canvas.image(loadedImg,0,0,500,400);
      canvas.endDraw();
    }
  }
}
