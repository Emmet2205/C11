var trex, trex_running, trex_collided;
var ground, invisibleGround, groundImage;
var cloud, cloudImage;


var obstacle1, obstacle2, obstacle3, obstacle4, obstacle5, obstacle6;

function preload() {
  trex_running = loadAnimation("trex1.png", "trex3.png", "trex4.png");
  trex_collided = loadImage("trex_collided.png");

  groundImage = loadImage("ground2.png")
  cloudImage = loadImage("cloud.png")
  obstacle1 = loadImage("obstacle1.png");
  obstacle2 = loadImage("obstacle2.png");
  obstacle3 = loadImage("obstacle3.png");
  obstacle4 = loadImage("obstacle4.png");
  obstacle5 = loadImage("obstacle5.png");
  obstacle6 = loadImage("obstacle6.png");
}

function setup() {
   createCanvas(600, 200);

   //crea el sprite del Trex
   trex = createSprite(50,160,20,50);
   trex.addAnimation("running", trex_running);
   trex.scale = 0.5;
  
   //crea el sprite del suelo
   ground = createSprite(200,180,400,20);
   ground.addImage("ground",groundImage);
   if(ground.x < 0){
       
   }
   ground.x = ground.width /2;
   ground.velocityX = -2;
   invisibleGround = createSprite(200,190,400,10);
   invisibleGround.visible = false;
}

function draw() {
   background(300);
   console.log(trex.y);
  
   //salta cuando se presiona la barra espaciadora
   if (keyDown("space")){  
      trex.velocityY = -10;
   }

   trex.velocityY = trex.velocityY + 0.8

   if (ground.x < 0.) {
      ground.x = ground.width / 2;
   }

   trex.collide(invisibleGround);
   spawnClouds();
   spawnObstacles();
   drawSprites();
}
 function spawnClouds(){
   if(frameCount %60 === 0){
      cloud = createSprite(600,100,40,10);
      cloud.addImage(cloudImage);
      cloud.y = Math.round(random(10,100));
      cloud.scale = 0.15;
      cloud.velocityX = -3;
      cloud.lifetime = 200;
      cloud.depth=trex.depth;
      trex.depth=trex.depth + 1;
   }

}
 function spawnObstacles(){
  if(frameCount %60 === 0){
    obstacle = createSprite(600,165,10,40);
    obstacle.velocityX = -6;
    var ran = Math.round(random(1,6));
    switch (ran){
        case 1: obstacle.addImage(obstacle1);
                 break;
        case 2: obstacle2.addImage(obstacle2);
                break;
        case 3: obstacle3.addImage(obstacle3);
                break;
        case 4: obstacle4.addImage(obstacle5);
                break;
        case 5: obstacle5.addImage(obstacle5);
                break;
        case 6: obstacle6.addImage(obstacle6);
                break;
     default: (break);
    }
    obstacle.scale = 0.15;
  }
   
   
 }

