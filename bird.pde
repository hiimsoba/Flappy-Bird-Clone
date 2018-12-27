class Bird {
  // position and velocity 
  PVector pos = new PVector(width * 0.15, height * 0.5);
  PVector vel = new PVector(0, 1);

  // the bird is white ( no racism, tho... please. )
  color c = color(255);

  // 12 pixels radius
  int r = 12;

  // and score starting at 0
  int score = 0;

  // check if the bird hit the upper or lower edge
  void checkEdges() {
    // if the bird hit the upper edge ( i.e. its position minus the radius is less than or equal to 0 )
    if (pos.y - r <= 0) {
      // constrain it to be inside the canvas, so set its y to be equal to (0 + its radius) 
      pos.y = r;
      // and make the velocity 0
      vel.y = 0;
    } else if (pos.y + r > height) {
      // and if the bird hit the bottom, then it just dies, 'cuz the floor is lava
      playing = false;
    }
  }

  // check if the bird hit a pipe
  void checkHit(Pipe p) {
    // since the pipe is just a rectangle, we need to perform some sort of circle - rectangle collision
    // if the rightmost and leftmost points of the bird are between the left and right side of the pipe
    if (pos.x + r > p.pos.x && pos.x - r < p.pos.x + p.w) {
      // and if the top point is lower on the y axis than the height of the pipe ( i.e. the bottom of the top pipe )
      // or the bottom point is higher on the y axis than the height + the fixed difference ( i.e. the top of the bottom pipe )
      if (pos.y - r < p.h || pos.y + r > p.h + Pipe.fixedDiff) {
        // then we hit that pipe
        // and we stop the game
        playing = false;
      }
    }
    // also, check if the bird passed the pipe
    // if it did ( i.e. the leftmost point of the bird is to the right of the right side of the pipe )
    // and if we haven't already taken the score for that pipe
    if (pos.x - r > p.pos.x + p.w && !p.scored) {
      // increase the score
      score++;
      // and set the pipe as being scored already
      p.scored = true;
    }
  }

  void update() {
    // if the mouse is pressed and it hasn't been pressed previously
    if (mousePressed && !up) {
      // then the bird should jump, so we set its velocity as the lifting force
      vel.y = force;
      // and keep track of the fact that we have pressed the mouse
      up = true;
    } else if (!mousePressed && up) {
      // otherwise, if the mouse isn't currently pressed but it was pressed before, update its state ( i.e. not pressed anymore )
      up = false;
    }
    // add the gravity to the velocity
    // physics system af
    vel.add(gravity);
    // and constrain the velocity to 1.75 times the lifting force, so that things don't get crazy with the gravity and stuff
    vel.y = constrain(vel.y, force * 1.75, - force * 1.75);
    // update the position
    pos.add(vel);
    // and do the edge checking
    checkEdges();
  }

  // draw the bird
  void show() {
    // no stroke, with its fill
    noStroke();
    fill(c);
    // and... draw an ellipse.
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
}
