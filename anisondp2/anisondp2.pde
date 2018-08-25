import ddf.minim.*;  //minimライブラリのインポート
 
Minim minim;  //Minim型変数であるminimの宣言
AudioPlayer player;  //サウンドデータ格納用の変数

//PImage katyusha, los, mission, panzer, correct, batsu;
PImage correct, batsu;

PImage [][] pho=new PImage[3][4];

String [] music=new String[3];

int frame, mu_num=3;

int count=0, pre_cout=0;

boolean hantei=false, flag=true, flag2=true, noclick=true;

int ran=0, ran2;

int[] mem, mu_mem;

//ArrayList<Integer> arrange=new ArrayList<Integer>();
 
void setup(){
 
  size(700, 700);
  
  pho[0][0]=loadImage("choise_Katyusha.png");
  pho[0][1]=loadImage("choise_losloslos.png");
  pho[0][2]=loadImage("choise_mission.png");
  pho[0][3]=loadImage("choise_panzer.png");
  pho[1][0]=loadImage("choise_orange.png");
  pho[1][1]=loadImage("choise_naisho.png");
  pho[1][2]=loadImage("choise_hana.png");
  pho[1][3]=loadImage("choise_light.png");
  pho[2][0]=loadImage("choise_answer.png");
  pho[2][1]=loadImage("choise_letter.png");
  pho[2][2]=loadImage("choise_orion.png");
  pho[2][3]=loadImage("choise_ryuo.png");
  
                 
   music[0]="Katyusha_01.mp3";
   music[1]="orangemint_01.mp3";
   music[2]="answer_01.mp3";
   
   mem=get_no_dup_numbers(4);
   mu_mem=get_no_dup_numbers(mu_num);
   ran=(int)random(4);
   
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
  
}
 

void draw(){
  
  //println("count="+count);
  
  if(count >= mu_num){
    flag2=false;
   exit(); 
  }
  
  if(flag2){
      
   playMusic(music[mu_mem[count]]);
   flag2=false;
   ran=(int)random(4);
  }
 
  background(200);
  line(width/2, 0, width/2, height);
  line(0,height/2, width, height/2);
  
  if((count-pre_cout)==0){
    putPhoto(pho[count][0], (ran+mem[0])%4+1);
    putPhoto(pho[count][1], (ran+mem[1])%4+1);
    putPhoto(pho[count][2], (ran+mem[2])%4+1);
    putPhoto(pho[count][3], (ran+mem[3])%4+1);
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
