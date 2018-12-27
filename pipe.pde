class Pipe {
  // keep this here, it's the length of the space between the top and bottom pipes
  static final float fixedDiff = 150;

  // width of the pipe, it's fixed
  float w = 60;
  
  // height of the top pipe
  float h = random(height * 0.2, height * 0.6);

  // position of the pipe, initially offscreen, on the right
  PVector pos = new PVector(width + w, 0);

  // velocity of the pipe, fixed for now
  PVector vel = new PVector(-8.5, 0);

  // keep track of whether or not the bird already scored this pipe
  boolean scored = false;

  // add the velocity to the pipe
  void update() {
    pos.add(vel);
  }

  // draw the pipe
  void show() {
    // first, update the pipe
    update();
    // gray-ish fill, no stroke
    fill(151);
    noStroke();
    // top pipe
    rect(pos.x, pos.y, w, h);
    // bottom pipe
    rect(pos.x, h + fixedDiff, w, height - h - fixedDiff);
  }
}
