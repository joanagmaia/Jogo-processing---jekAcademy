int incjog1 = 0, incjog2 = 0, xjog1 = 0, yjog1 = 0, xjog2 = 990, yjog2 = 0, xbola =500, ybola =300, velxbola, velybola, raio=10, direcaox,direcaoy, pontosjog1 = 0, pontosjog2 = 0, segundos, tempo,comp1=70,comp2=70;
boolean gameOver=false;
int m=1,seg=60, score1,score2;
void setup () {
  size (1000,600);
  velocidade();
}

void draw () {
  background(255);
  segundos = millis()/1000;
  strokeWeight(10);
  line(width/2,0,width/2,height);
  strokeWeight(1);
  fill(0);
  rect(xjog1,yjog1,10,comp1);
  rect(xjog2,yjog2,10,comp2);
  movePecas();
  ellipse(xbola,ybola,2*raio,2*raio);
  yjog1+=incjog1;
  yjog2+=incjog2;
  xbola+=velxbola;
  ybola+=velybola;
  moveBola();
  pontosTempo();
  perdePontos();
  extracomp();
  if(gameOver) {
    fill(255);
    rect(0,0,width,height);
    textSize(100);
    fill(0);
    text("Game Over",width/2-200,height/2);
  }
}
//barras a moverem-se com o teclado e não as deixa sair da janela
void movePecas () {
  if (keyCode==UP)
    incjog2 = -6;
  if (keyCode==DOWN)
    incjog2 = 6;
  if (keyPressed && key=='w')
    incjog1 = -6;
  if (keyPressed && key=='s')
    incjog1 = 6;
  if (!keyPressed) {
    incjog1=0;
    incjog2=0;
  }
  if (yjog1<=0)
    yjog1=0;
  if (yjog2<=0)
    yjog2=0;
  if (yjog1>=height-comp1)
    yjog1=height-comp1;
  if (yjog2>=height-comp2)
    yjog2=height-comp2;
}
//bola a bater na parede de cima e de baixo e nas barras
void moveBola () {
  if(ybola<raio || ybola>height-raio) 
    velybola*=-1;
  if(xbola<xjog1+10+raio && ybola>yjog1 && ybola<yjog1+comp1)
    velxbola*=-1;
  if(xbola>xjog2-raio && ybola>yjog2 && ybola<yjog2+comp2)
    velxbola*=-1;
}
//quando se marcam pontos
void perdePontos () {
  if (xbola<raio) {
     pontosjog2++;
     xbola=500;
     ybola=int(random(raio,300-raio));
     velocidade();
  }
  if (xbola>width-raio) {
     pontosjog1++;
     xbola=500;
     ybola=int(random(raio,300-raio));
     velocidade();
  }
}
//opcional
void pontosTempo () {
  textSize(80);
  text(pontosjog1,width/4,100);
  text(pontosjog2,width-width/4,100);
  textSize(20);
  int minutos = segundos / 60;
  if (segundos == 60) { 
      m = 1;
      seg = 119;
   }
   text((m-minutos) + " : " + (seg-segundos), width-100, 550);
   if(m-minutos==0 && seg-segundos==0) {
     gameOver=true;
   }
}
//quando marcam ponto e a bola tem que ser reposta
void velocidade () {
  velxbola=int(random(4,5));
  velybola=int(random(4,5));
  direcaox=int(random(2));
  direcaoy=int(random(2));
  if(direcaox==0)
    velxbola*=-1;
  if(direcaoy==0)
    velybola*=-1;
}
//opcional
void extracomp () {
  if(pontosjog1==3) {
    comp1=120;
  }
  if(pontosjog2==3) {
    comp2=120;
  }
  if(pontosjog1==4) {
    comp1=70;
  }
  if(pontosjog2==4) {
    comp2=70;
  }
}
