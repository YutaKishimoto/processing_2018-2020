import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;

void setup(){
  size(512,200);
  minim = new Minim(this);
  player = minim.loadFile("");
}

void mousePressed(){
  player.rewind();
  player.play();
}

void draw(){
  background(0);
  stroke(55);
  for(int i=0; i < player.bufferSize()-1; i++){
    float x1 = map(i,0,player.bufferSize(),0,width);
    float x2 = map(i+1,0,player.bufferSize(),0,width);
    line(x1,50+player.left.get(i)*50,x2,50 + player.left.get(i+1)*50);
    line(x1,150+player.right.get(i)*50,x2,150 + player.right.get(i+1)*50);
  }
}