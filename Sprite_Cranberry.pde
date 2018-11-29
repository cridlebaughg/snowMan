//SPRITE CRANBERRY

double[] ground = new double[1250];
double slope;
Snowman frosty = new Snowman();
int timer;

void setup(){
  size(1200, 800);
  genGround();
  frameRate(60);
  setup2();
}

void draw(){
  timer++;
  fill(#000000);
  rect(0, 0, width, height);
  renderGround();
  frosty.go();
  draw2();
}

void genGround(){
  ground[0] = (Math.random()-0.5) * 100 + 670;
  slope = getSlope();
  for(int i = 1; i < ground.length; i++){
    ground[i] = ground[i - 1] + slope;
    slope += getSlope();
    if(Math.abs(670 - ground[i]) > 100){
      slope *= -1;
    }
  }
}

double getSlope(){
  return (Math.random() - 0.5) / 30;
}

void renderGround(){
  noStroke();
  fill(255, 255, 255, 128);
  for(int i = 0; i < ground.length; i++){
    rect((int)i, (int)ground[i], 1, 800 - (int)ground[i]);
  }
}

class Snowman{
  int x, y, jumpTimer;
  double yVel;
  SnowBall[] body = new SnowBall[3];
  public Snowman(){
    x = 0;
    y = 0;
    jumpTimer = 0;
    body[0] = new SnowBall(100, 80);
    body[1] = new SnowBall(70, 108);
    body[2] = new SnowBall(40, 126);
  }
  
  void go(){
    jump();
    move();
    render();
  }
  
  void jump(){
    if(x == 1250){
      x = 0;
      y = 0;
    }
    System.out.println(body[0].y + " " + ground[x] + " " + body[0].yVel);
    if(body[0].y > ground[x] - body[0].up && body[0].yVel > 0){
      System.out.println("stopped");
      for(int i = 0; i < body.length; i++){
        body[i].y = (int)ground[x] - body[i].up;
        body[i].yVel = -30;
      }
      jumpTimer = timer + 30;
    }
  }
  
  void move(){
    if(timer > jumpTimer){
      x++;
      for(int i = 0; i < 3; i++){
        body[i].move();
        body[i].yStr = 1;
      }
    }
  }
  
  void render(){
    fill(#ffffff);
    /*ellipse(x, body[0].y - 50, 100, 100);
    ellipse(x, body[1].y - 120, 70, 70);
    ellipse(x, body[2].y - 165, 40, 40);*/

    for(int i = 0; i < body.length; i++){
      ellipse(x, (int)(body[i].y + body[i].siz / 2), (int)(body[i].siz * body[i].yStr), (int)(body[i].siz * body[i].xStr));
      //System.out.println(body[i].siz * body[i].yStr);
    }
  }
  
}

class SnowBall{
  int y, siz, up;
  double yVel, xStr, yStr;
  public SnowBall(int s, int u){
    siz = s;
    y = 0;
    up = u;
  }
  void stretch(){
    
  }
  void move(){
    yVel += 1;
    y += yVel;
    yStr += yVel/100;
    //System.out.println("sadfdsaf     " + yStr);
    xStr = 1 / yStr;
  }
}

Snowflake [] s = new Snowflake[300]; 
Moon m = new Moon();
void setup2(){
  size(1200,800);
  
  for(int i = 0; i<s.length; i++){
    s[i] = new Snowflake();
  }
  
}
 void draw2(){
   //background(0);
   for(int i = 0; i<s.length; i++){
     s[i].move();
     s[i].show();
   }
   
   
   m.move();
   m.show();
   
   
 }

interface snow{
  void move();
  void show();
}



class Moon{
  float size, x, y, x2, speed;

  Moon(){
    size = 150;
    x= 900; 
    y = 150;
    x2= 750;
    speed=.5;
  }
  
  void move(){
    x2+=speed;
    if(x2>1050){
      speed*=-1;
    }
    if(x2<750){
      speed*=-1;
    } 
  }
  
  void show(){
    fill(225, 225, 225);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x2, y, size, size);
  }
  
}


class Snowflake implements snow{
  double size, speed, x, y, xchange; 
  
  Snowflake(){
    x = Math.random()*1200;
    y = Math.random()*800;
    size = (Math.random()*7)+1;
    speed = (Math.random()*2);
    xchange = random(-.75,.75);
  }
  
  void move(){
    x+= xchange;
    y+=speed;
    
    if(x<0 || x >1200){
      x= Math.random()*1200;
    }
    if(y>800){ 
      y= 0; 
    }
  }
  
  void show(){
    fill(225,225,225);
    ellipse((float)x, (float)y, (float)size, (float)size);
  }
  
  
}



































/*
//SPRITE CRANBERRY

double[] ground = new double[1250];
double slope;
Snowman frosty = new Snowman();
int timer;

void setup(){
  size(1200, 800);
  genGround();
}

void draw(){
  timer++;
  fill(#000000);
  rect(0, 0, width, height);
  renderGround();
  frosty.go();
}

void genGround(){
  ground[0] = (Math.random()-0.5) * 100 + 670;
  slope = getSlope();
  for(int i = 1; i < ground.length; i++){
    ground[i] = ground[i - 1] + slope;
    slope += getSlope();
    if(Math.abs(670 - ground[i]) > 100){
      slope *= -1;
    }
  }
}

double getSlope(){
  return (Math.random() - 0.5) / 30;
}

void renderGround(){
  noStroke();
  fill(#ffffff);
  for(int i = 0; i < ground.length; i++){
    rect((int)i, (int)ground[i], 1, 800 - (int)ground[i]);
  }
}

class Snowman{
  int x, y, jumpTimer;
  double yVel;
  SnowBall[] body = new SnowBall[3];
  public Snowman(){
    x = 0;
    y = 0;
    jumpTimer = 0;
    body[0] = new SnowBall();
  }
  
  void go(){
    jump();
    move();
    render();
  }
  
  void jump(){
    if(x == 1250){
      x = 0;
      y = 0;
    }
    if(y > ground[x] + 15 && yVel > 0){
      yVel = -30;
      jumpTimer = timer + 30;
    }
  }
  
  void move(){
    System.out.println("t " + timer + " " + jumpTimer);
    if(timer > jumpTimer){
      x++;
      y += yVel / 2.5;
      yVel += 1;
    }
  }
  
  void render(){
    fill(#ffffff);
    ellipse(x, y - 50, 100, 100);
    ellipse(x, y - 120, 70, 70);
    ellipse(x, y - 165, 40, 40);

  }
  
}

class SnowBall{
  int y, yVel, wid, hei;
  public SnowBall(){
    
  }
  void stretch(){
    
  }
  void move(){
    
  }
}























*/
