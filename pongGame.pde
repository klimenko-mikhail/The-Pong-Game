final int MENU_STATE = 0;
final int GAME_STATE = 1;
final int PAUSED_STATE = 2;
final int VICTORY_STATE = 3;
final int DEFEAT_STATE = 4;

int currentState = MENU_STATE;

// Ball
final int BALL_SIZE = 20;
final int HALF_BALL_SIZE = BALL_SIZE / 2;

int ballX;
int ballY;
int ballDX = 10;
int ballDY = 10;

// Score

final int SCORE_TEXT_SIZE = 50;
final int SCORE_MARGIN_TOP = 50;
final int SCORE_MARGIN_SIDES = 70;

int rightPlayerScore = 0;
int leftPlayerScore = 0;

// Paddles

final int PADDLES_WIDTH = 50;
final int PADDLES_HEIGHT = 120;
final int PADDLES_HALF_WIDTH = PADDLES_WIDTH / 2;
final int PADDLES_HALF_HEIGHT = PADDLES_HEIGHT / 2;

int leftPaddleX;
int leftPaddleY;
int leftPaddleDY = 7;

int rightPaddleX;
int rightPaddleY;
int rightPaddleDY = 7;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  rectMode(CENTER);

  ballX = width / 2;
  ballY = height / 2;

  leftPaddleX = PADDLES_HALF_WIDTH;
  rightPaddleX = width - PADDLES_HALF_WIDTH;
  leftPaddleY = rightPaddleY = height / 2;
}

void draw() { 
  switch (currentState) {
  case MENU_STATE:
    drawMenu();
    break;
  case GAME_STATE:
    drawGame();
    break;
  case PAUSED_STATE:
    drawPause();
    break;
  case VICTORY_STATE:
    drawVictory();
    break;
  }
}
