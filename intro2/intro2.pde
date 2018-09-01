import ddf.minim.*;  //minimライブラリのインポート
import java.io.File;
import java.io.FilenameFilter;
 
Minim minim;  //Minim型変数であるminimの宣言
AudioPlayer player;  //サウンドデータ格納用の変数

//PImage katyusha, los, mission, panzer, correct, batsu;
PImage correct, batsu;

//PImage [][] pho=new PImage[6][4];

//String [] music=new String[6];

int frame, mu_num=1;

int count=0, pre_cout=0;

boolean hantei=false, flag=true, flag2=true, noclick=true;

int ran=0, ran2;

int[] mem, mu_mem;

//ArrayList<Integer> arrange=new ArrayList<Integer>();

File[] musicFiles;

String [] musicfiles=new String[6];

double mu_s=0;

Mp3FileFilter filter;

String [][] Choices=new String[6][4];

PFont font;

//boolean textDraw=true;
 
void setup(){
 
  size(700, 700);
    
  //pho[0][0]=loadImage("choise_Katyusha.png");
  //pho[0][1]=loadImage("choise_losloslos.png");
  //pho[0][2]=loadImage("choise_mission.png");
  //pho[0][3]=loadImage("choise_panzer.png");
  //pho[1][0]=loadImage("choise_orange.png");
  //pho[1][1]=loadImage("choise_naisho.png");
  //pho[1][2]=loadImage("choise_hana.png");
  //pho[1][3]=loadImage("choise_light.png");
  //pho[2][0]=loadImage("choise_answer.png");
  //pho[2][1]=loadImage("choise_letter.png");
  //pho[2][2]=loadImage("choise_orion.png");
  //pho[2][3]=loadImage("choise_ryuo.png");
  //pho[3][0]=loadImage("choise_ending.png");
  //pho[3][1]=loadImage("choise_sirusi.png");
  //pho[3][2]=loadImage("choise_lady.png");
  //pho[3][3]=loadImage("choise_pride.png");
  //pho[4][0]=loadImage("choise_ring.png");
  //pho[4][1]=loadImage("choise_heart.png");
  //pho[4][2]=loadImage("choise_bird.png");
  //pho[4][3]=loadImage("choise_love.png");
  //pho[5][0]=loadImage("choise_bookmark.png");
  //pho[5][1]=loadImage("choise_swan.png");
  //pho[5][2]=loadImage("choise_kizuna.png");
  //pho[5][3]=loadImage("choise_rate.png");
  
  font=createFont("Yu Gothic", 20, true);
  textFont(font);
  pixelDensity(2);
  
  Choices[0][0]="いい日旅立ち";
  Choices[0][1]="冬の色";
  Choices[0][2]="秋桜";
  Choices[0][3]="青い果実";
  Choices[1][0]="ワイルドセブン";
  Choices[1][1]="ミラクル・ガイ";
  Choices[1][2]="つむじかぜ";
  Choices[1][3]="WILD";
  Choices[2][0]="学生街の喫茶店";
  Choices[2][1]="一人で行くさ";
  Choices[2][2]="たんぽぽ";
  Choices[2][3]="散歩";
  Choices[3][0]="津軽海峡・冬景色";
  Choices[3][1]="加賀岬";
  Choices[3][2]="天城越え";
  Choices[3][3]="能登半島";
  Choices[4][0]="花は咲く";
  Choices[4][1]="花の歌";
  Choices[4][2]="ぼくら";
  Choices[4][3]="風が吹いている";  
  Choices[5][0]="麦の唄";
  Choices[5][1]="地上の星";
  Choices[5][2]="泣いてもいいんだよ";
  Choices[5][3]="一期一会";
  
   
   //println("ran_set="+ran);
   
   //for(int n=0; n < 4; n++){
   // arrange.add(-1); 
   //}
   
   //while(mem<4){
   //  ran2=(int)random(4);
   // if(arrange.indexOf(ran2)!=-1){
   //  continue; 
   // }else{
   //  arrange.add(ran2); 
   // }
     
   //}
   
   //println("arrange="+arrange);
  
  
  //katyusha=loadImage("choise_Katyusha.png");
  //los=loadImage("choise_losloslos.png");
  //mission=loadImage("choise_mission.png");
  //panzer=loadImage("choise_panzer.png");
  correct=loadImage("correct.png");
  batsu=loadImage("batsu.png");
  
  filter=new Mp3FileFilter();
  musicFiles=new File(dataPath("")).listFiles(filter);
  
  for(File file: musicFiles){
   println(file.getName()); 
   musicfiles[mu_num-1]=file.getName();
   mu_num++;
  }
  
  println("mu_num="+mu_num);
  
   mem=get_no_dup_numbers(4);
   mu_mem=get_no_dup_numbers(mu_num-1);
   ran=(int)random(4);
  
  
}
 

void draw(){
  
  //println("count="+count);
  
  if(count >= (mu_num-1)){
    flag2=false;
   exit(); 
  }
  
  if(flag2){
      
   playMusic(musicfiles[mu_mem[count]]);
   mu_s=millis();
   flag2=false;
   ran=(int)random(4);
   //println("play count="+count);
  }
 
  background(200);
  line(width/2, 0, width/2, height);
  line(0,height/2, width, height/2);
  
  if((count-pre_cout)==0){
    //putPhoto(pho[mu_mem[count]][0], (ran+mem[0])%4+1);
    //putPhoto(pho[mu_mem[count]][1], (ran+mem[1])%4+1);
    //putPhoto(pho[mu_mem[count]][2], (ran+mem[2])%4+1);
    //putPhoto(pho[mu_mem[count]][3], (ran+mem[3])%4+1);
    drawChoice(Choices[mu_mem[count]][0], (ran+mem[0])%4+1);
    drawChoice(Choices[mu_mem[count]][1], (ran+mem[1])%4+1);
    drawChoice(Choices[mu_mem[count]][2], (ran+mem[2])%4+1);
    drawChoice(Choices[mu_mem[count]][3], (ran+mem[3])%4+1);
    //println("draw count="+count);
  }else{
    pre_cout=count;
    flag=true;
  }
  
  if(mousePressed && noclick){
    println("ran_hanitei="+ran+" (ran%4)+1="+((ran%4)+1));
    frame=frameCount;
    hantei=decision(mouseX, mouseY, (ran+mem[0])%4+1);
    noclick=false;
  }
   
  if(!noclick && (frameCount-frame)<100){
 
     if(hantei){
    image(correct, 100, 100, 500, 500);
    //println("frame="+frame+"frameCount="+frameCount);
  } 
  else{
    image(batsu, 100, 100, 500, 500);
    //println("frame="+frame+"frameCount="+frameCount);
  }
     
   }
   
   else if(!noclick && (frameCount-frame)>=100){ 
     player.close();
    noclick=true;
    flag2=true;
    count++;
    
    
   }
   
   if((millis()-mu_s) > 10000){
     player.close();
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
  
  if(choise==4){
    
    if(x>=350 && x<=700 && y>=350 && y<=700) dec=true;
    
  }
  
  println("x="+x+"y="+y+"dec="+dec);
  
  return dec;
  
}

//void putPhoto(PImage photo, int cell){
  
//  if(cell==1){
//       image(photo, 75, 125, 200, 100);
//  }
  
//  else if(cell==2){
//    image(photo, 425, 125, 200, 100);
//  }
  
//  else if(cell==3){
//    image(photo, 75, 475, 200, 100);
//  }
  
//  else if(cell==4){
//    image(photo, 425, 475, 200, 100);
//  }
  
//}

void drawChoice(String choice, int cell){
  
  if(cell==1){
    
    fill(0, 0, 0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(choice, 175, 175);
 
  }
  
  else if(cell==2){
    
    fill(0, 0, 0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(choice, 525, 175);
 
  }
  
  else if(cell==3){
     
    fill(0, 0, 0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(choice, 175, 525);
 
  }
  
  else if(cell==4){
     
    fill(0, 0, 0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(choice, 525, 525);
 
  }
  
}

void playMusic(String mus){
  
 minim = new Minim(this);  
  player = minim.loadFile(mus); 
  player.play();   
  
}

int[] get_no_dup_numbers(int number){
   
  IntList nums = new IntList(number);
  for (int i = 0; i < number; i++){
    nums.append(i);
  };
  nums.shuffle();
  int[] result = nums.array();
  return result;
}

public class Mp3FileFilter implements FilenameFilter{
 
  public boolean accept(File directory, String fileName){
    
   if(fileName.endsWith(".mp3")){
     return true;
   }else{
     return false;
   }
          
  }
  
}
