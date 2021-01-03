void draw() {

  /*
  ----- draw settings ----- */

  Boolean fillOrNot = T;

  if (fillOrNot) {
    fill(0, 0, 100, 100);
    noStroke();
    rect(0, 0, width, height);
  }

  /*
  FUNCTIONS --------------- */

  // waveform By points
  int step = 10;

  for (int i = 0; i < width; i += step) {
    for (int j = 0; j < height; j += step) {
      int num = int(map(i * j, 0, width * height, 0, _halfBuffer));
      float amp = player.left.get(num);
      float size = 60 + amp * 10;

      //stroke(0, 0, 0, 20 + 2 * amp);
      //strokeWeight(0.8);
      //noFill();
      //ellipse(i, amp * height / 3 + height / 2, size, size);
      
      stroke(0, 0, 0, 30 + 30 * amp);
      strokeWeight(20);
      point(i, j);
    }
  }


  /*
  End of FUNCTIONS---------- */
  /*
  Render ----- --- */

  if (render) {
    saveFrame(_fileName);
    if (frameCount%100 == 0) {
      println("-- Rendering : " + frameCount + " / " + _totalFrames + " (" + int(frameCount * 100 / _totalFrames) + " % Time At | " + millis());
    }
  }
}