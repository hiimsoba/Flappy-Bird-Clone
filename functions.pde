void play() {
  // reset the background
  background(0);
  // update and show the bird
  bird.update();
  bird.show();
  // check if we shall add a new pipe
  if (frameCount % frames == 0) {
    pipes.add(new Pipe());
  }
  // and now, for each pipe
  // loop backwards to be able to remove pipes if they are off the screen without screwing things up
  for (int i = pipes.size() - 1; i >= 0; i--) {
    Pipe current = pipes.get(i);
    // check if it went off the screen
    if (current.pos.x + current.w < 0) {
      // if so, remove it
      pipes.remove(i);
    } else {
      // otherwise, check if the bird hit the pipe and show the pipe
      bird.checkHit(current);
      current.show();
    }
  }
  // draw the text on the left top corner
  textSize(28);
  fill(255);
  text("Score : " + bird.score, 90, 45);
}

void game_over() {
  // if we got here, then the player is really bad
  // jk
  // reset the background
  background(0);
  // and draw some things to make the player PLAY AGAIN!
  fill(255);
  textSize(32);
  text("Do you think that a score of " + bird.score + " is enough?", width * 0.5, height * 0.4);
  textSize(24);
  text("...touch the screen to play again!", width * 0.5, height * 0.65);
}

// reset the game
void resetGame() {
  // so basically, reset the bird's position and velocity
  bird.pos.y = height * 0.5;
  bird.vel.y = 1;
  // clear the pipe arraylist and add a single one
  pipes.clear();
  pipes.add(new Pipe());
  // reset the frame count and the bird's score
  frameCount = 0;
  bird.score = 0;
  // and set the state of the game as "PLAYING"!
  playing = true;
}
