import fisica.*; // fisicaライブラリを使いますという宣言
FWorld world; // 世界

PFont myFont; //フォント

void setup() {
  size(1000, 600);// 画面サイズの設定
  Fisica.init(this);// fisicaライブラリの初期化
  world = new FWorld();// 世界を新しく作る
  world.setGravity(0, 600);//世界に重力を設定する

  myFont = createFont("HGSGothicE-48", 10);  //フォントの指定
  textFont(myFont);  

  FPoly poll1 = new FPoly(); //道の設定
  poll1.vertex(width*80/100, height*25/100);
  poll1.vertex(width*5/100, height*45/100);
  poll1.vertex(width*5/100, height*46/100);
  poll1.vertex(width*80/100, height*26/100);
  poll1.setStatic(true);
  poll1.setFill(0, 255, 255);
  world.add(poll1);

  FPoly poll2 = new FPoly(); //道2の設定
  poll2.vertex(0, height*50/100);
  poll2.vertex(width*30/100, height*65/100);
  poll2.vertex(width*30/100, height*66/100);
  poll2.vertex(0, height*51/100);
  poll2.setStatic(true);
  poll2.setFill(0, 255, 255);
  world.add(poll2);

  FPoly seesow = new FPoly(); //シーソーの設定
  seesow.vertex(width*30/100, height*74/100);
  seesow.vertex(width*32/100, height*74/100);
  seesow.vertex(width*32/100, height*94/100);
  seesow.vertex(width*41/100, height*94/100);
  seesow.vertex(width*41/100, height*74/100);
  seesow.vertex(width*43/100, height*74/100);
  seesow.vertex(width*43/100, height*94/100);
  seesow.vertex(width*60/100, height*94/100);
  seesow.vertex(width*60/100, height*74/100);
  seesow.vertex(width*62/100, height*74/100);
  seesow.vertex(width*62/100, height*94/100);
  seesow.vertex(width*70/100, height*94/100);
  seesow.vertex(width*70/100, height*74/100);
  seesow.vertex(width*72/100, height*74/100);
  seesow.vertex(width*72/100, height*96/100);
  seesow.vertex(width*30/100, height*96/100);
  seesow.setFill(255, 0, 0);
  world.add(seesow);
  FPoly seesow2 = new FPoly();
  seesow2.vertex(width*47/100, height*96/100);
  seesow2.vertex(width*43/100, height*100/100);
  seesow2.vertex(width*51/100, height*100/100);
  seesow2.setStatic(true);
  seesow2.setFill(0, 0, 255);
  world.add(seesow2);

  FPoly stop = new FPoly(); //留め具の設定
  stop.vertex(width*29/100, height*97/100);
  stop.vertex(width*30/100, height*97/100);
  stop.vertex(width*30/100, height*99/100);
  stop.vertex(width*32/100, height*99/100);
  stop.vertex(width*32/100, height);
  stop.vertex(width*29/100, height);
  stop.setStatic(true);
  stop.setFill(0, 0, 255);
  world.add(stop);
  FPoly stop2 = new FPoly();
  stop2.vertex(width*73/100, height*97/100);
  stop2.vertex(width*72/100, height*97/100);
  stop2.vertex(width*72/100, height*99/100);
  stop2.vertex(width*70/100, height*99/100);
  stop2.vertex(width*70/100, height);
  stop2.vertex(width*73/100, height);
  stop2.setStatic(true);
  stop2.setFill(0, 0, 255);
  world.add(stop2);
}

void draw() {
  background(255);// 背景の初期化
  world.step();// 世界の状態更新
  world.draw();//世界の描画

  noStroke();  
  fill(255, 0, 0, 80);
  rect(width*80/100, 10, width-width*80/100-10, height*20/100); //発射領域の設定
  fill(0);
  textSize(20);
  text("PUSH this zone!!", width*80/100+20, 80);

  fill(255, 0, 0);
  pushMatrix();
  rotate(radians(-7));
  textSize(130);
  text("頑張れ!", 450, 470); //メッセージの設定
  text("ニ", 525, 585);
  text("本!!", 650, 610);
  popMatrix();
}

void mousePressed() {
  FCircle ball = new FCircle(25);// 大きさ25のボールを作る
  ball.setPosition( mouseX, mouseY ); // ボールの位置を設定
  ball.setRestitution(0.7); // ボールの反発係数を設定
  ball.setFill(0, 255, 0); // ボールの色を設定
  ball.setVelocity(-400, 0); //ボールの初速を設定
  if (mouseY<height*20/100&&mouseX>width*80/100) {
    world.add(ball); // 世界にボールを追加
  }
}

