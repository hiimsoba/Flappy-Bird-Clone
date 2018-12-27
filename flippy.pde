// the player, which is A BIRD! owo
Bird bird;

// our gorgeous pipes
ArrayList<Pipe> pipes;

// gravity and the force with which the bird is pulled up
float gravity_val = 0.75;
float force = -9.5;

// create a gravity vector
PVector gravity = new PVector(0, gravity_val);

// how many frames before we add a new pipe?
int frames = 40;

// keep track of whether the game is playing or it's game over
boolean playing = true;

// keeps track of whether or not the mouse has been pressed in the previous frame(s)
boolean up = false;

void setup() {
  // create a 800x600 window
  size(800, 600);
  // initialize our player bird
  bird = new Bird();
  // create the arraylist of pipes
  pipes = new ArrayList<Pipe> ();
  // and add a single pipe
  pipes.add(new Pipe());
  // and align the text
  textAlign(CENTER, CENTER);
}

void draw() {
  // if the game is still going on
  if (playing) {
    // then... the game goes on
    play();
  } else {
    // otherwise, go to the game over screen
    game_over();
    // and if the player clicked on his magnificent mouse, reset the game
    if (mousePressed && !up) {
      resetGame();
      up = true;
    } else if (!mousePressed) {
      up = false;
    }
  }
}
