final int MENU_STATE = 0;
final int GAME_STATE = 1;
final int PAUSED_STATE = 2;
final int VICTORY_STATE = 3;

int currentState = MENU_STATE;

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
  // Ball

  background(0);
  fill(0xFF00F712);
  ellipse(ballX, ballY, BALL_SIZE, BALL_SIZE);

  ballX -= ballDX;
  ballY -= ballDY;

  if (ballX - HALF_BALL_SIZE >= width) {
    leftPlayerScore++;
    ballX = width / 2;
    ballY = height / 2;
    ballDX *= -1;
  }

  if (ballX + HALF_BALL_SIZE < 0) {
    rightPlayerScore++; 
    ballX = width / 2;
    ballY = height / 2;
    ballDX *= -1;
  }

  if (ballY + HALF_BALL_SIZE >= height || ballY - HALF_BALL_SIZE < 0) {
    ballDY *= -1;
  }

  // Paddles

  rect(rightPaddleX, rightPaddleY, PADDLES_WIDTH, PADDLES_HEIGHT);
  rect(leftPaddleX, leftPaddleY, PADDLES_WIDTH, PADDLES_HEIGHT);

  if (keyPressed) {
    if (keyCode == UP) {
      leftPaddleY -= leftPaddleDY;
      rightPaddleY -= rightPaddleDY;
      if (leftPaddleY - PADDLES_HALF_HEIGHT < 0) {
        leftPaddleY = PADDLES_HALF_HEIGHT;
      }
      if (rightPaddleY - PADDLES_HALF_HEIGHT < 0) { // Второй игрок/компьтер
        rightPaddleY = PADDLES_HALF_HEIGHT;
      }
    } else if (keyCode == DOWN) {
      leftPaddleY += leftPaddleDY;
      rightPaddleY += rightPaddleDY;
      if (leftPaddleY + PADDLES_HALF_HEIGHT > height) {
        leftPaddleY = height - PADDLES_HALF_HEIGHT;
      }
      if (rightPaddleY + PADDLES_HALF_HEIGHT > height) { // Второй игрок/компьтер
        rightPaddleY = height - PADDLES_HALF_HEIGHT;
      }
    }
  }

  // Collision Detection

  if (abs(ballX - leftPaddleX) < HALF_BALL_SIZE + PADDLES_HALF_WIDTH &&
    abs(ballY - leftPaddleY) < HALF_BALL_SIZE + PADDLES_HALF_WIDTH ||
    abs(ballX - rightPaddleX) < HALF_BALL_SIZE + PADDLES_HALF_WIDTH &&
    abs(ballY - rightPaddleY) < HALF_BALL_SIZE + PADDLES_HALF_WIDTH) {
    ballDX *= -1;
  }

  // Score

  textSize(SCORE_TEXT_SIZE);
  textAlign(CENTER, CENTER);
  text(leftPlayerScore, SCORE_MARGIN_SIDES, SCORE_MARGIN_TOP);
  text(rightPlayerScore, width - SCORE_MARGIN_SIDES, SCORE_MARGIN_TOP);
}
