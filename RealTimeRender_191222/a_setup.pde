void settings(){
  size(640, 360, P3D);
}  

void setup(){
  
  println("-- 1 -- setup() start | TimeAt : " + millis() + " -----");

  frameRate(_fRate);
  
  colorMode(HSB, 500, 100, 100, 100);
  _black = color(0, 0, 0, 100);
  _white = color(0, 0, 100, 100);
  
  background(_white);
  stroke(_black);
  strokeWeight(1);
  
  
  minim = new Minim(this);
  player = minim.loadFile(_audioFile, _bufferSize);
  
  _length = player.length();
  _sRate = player.sampleRate();
  _totalFrames = int(_length / 1000 / _fRate) + 1;
  _max_spf = int(_sRate / _fRate);
  
  println("-- 2 -- setup() END | TimeAt : " + millis() + " -----");
  println(_audioFile + " | " + _sRate + " (Hz) | " + _length + "(ms)");
  println("totalFrames : " + _totalFrames + " | max spf is " + _max_spf);
  
  player.play();
}


// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
//   PLAY and STOP
// WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW

void keyPressed() {
  if (key == 32) {
    if (player.isPlaying() == true) {
      player.pause();
      noLoop();
    } else {
      player.loop();
      loop();
    }
  }
}