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
