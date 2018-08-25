import ddf.minim.*;  //minimライブラリのインポート
 
Minim minim;  //Minim型変数であるminimの宣言
AudioPlayer player;  //サウンドデータ格納用の変数

PImage katyusha, los, mission, panzer, correct, batsu;

int frame;

boolean hantei,flag=false, noclick=true;
 
void setup(){
 
  size(700, 700);
  minim = new Minim(this);  
  player = minim.loadFile("Katyusha_01.mp3"); 
  player.play();  
  
  katyusha=loadImage("choise_Katyusha.png");
  los=loadImage("choise_losloslos.png");
  mission=loadImage("choise_mission.png");
  panzer=loadImage("choise_panzer.png");
  correct=loadImage("correct.png");
  batsu=loadImage("batsu.png");
  
}
 

void draw(){
 
  background(200);
  line(width/2, 0, width/2, height);
  line(0,height/2, width, height/2);
  //image(katyusha, 75, 125, 200, 100);
  //image(los, 75, 475, 200, 100);
  //image(mission, 425, 125, 200, 100);
  //image(panzer, 425, 475, 200, 100);
  
  putPhoto(katyusha, 1);
  putPhoto(los, 3);
  putPhoto(mission, 2);
  putPhoto(panzer, 4);
  
  if(mousePressed && noclick){
    frame=frameCount;
    hantei=decision(mouseX, mouseY, 1);
    flag=true;
    noclick=false;
  }
   
  if(flag && (frameCount-frame)<100){
     
     if(hantei){
    image(correct, 100, 100, 500, 500);
    //println("frame="+frame+"frameCount="+frameCount);
  } 
  else{
    image(batsu, 100, 100, 500, 500);
    //println("frame="+frame+"frameCount="+frameCount);
  }
     
   }
   
   else if(flag && (frameCount-frame)>=100){
    flag=false; 
    noclick=true;
   }
 
}


 
void stop(){
 
  player.close();  //サウンドデータを終了
  minim.stop();
  super.stop();
  
}

boolean decision(int x, int y,  int choise){
  
  boolean dec=false;
  
  if(choise==1){
    
    if(x>=0 && x<=350 && y>=0 && y<=350) dec=true;
    
  }
  
  if(choise==2){
    
    if(x>=350 && x<=700 && y>=0 && y<=350) dec=true;
    
  }
  
  if(choise==3){
    
    if(x>=0 && x<=350 && y>=350 && y<=700) dec=true;
    
  }
  
  if(choise==3){
    
    if(x>=350 && x<=700 && y>=350 && y<=700) dec=true;
    
  }
  
  println("x="+x+"y="+y+"dec="+dec);
  
  return dec;
  
}

void putPhoto(PImage photo, int cell){
  
  if(cell==1){
       image(photo, 75, 125, 200, 100);
  }
  
  else if(cell==2){
    image(photo, 425, 125, 200, 100);
  }
  
  else if(cell==3){
    image(photo, 75, 475, 200, 100);
  }
  
  else if(cell==4){
    image(photo, 425, 475, 200, 100);
  }
  
}
