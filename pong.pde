void drawMenu() {
  fill(255, 0, 0);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("The Pong Game", width / 2, height / 2);

  fill(255);
  textSize(40);
  text("Press Enter to start the game", width / 2, height / 2 + 100);
}

void drawPause() {
  textAlign(CENTER, CENTER);

  fill(255);
  textSize(40);
  text("Press P to continue the game", width / 2, height / 2);
}

float angle;
void drawVictory() {
  noStroke();
  pushMatrix();
  translate(width / 2, height / 2);
  for (int i = 0; i < 100; i++) {
    rotate(angle);
    angle += 0.00005;
    translate(i * 10, 0);
    fill(200 * i / 100.0);
    rect(0, 0, 100, 100);
  }
  popMatrix();

  // TODO

  fill(255, 0, 0);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("You are Victory!", width / 2, height / 2);

  fill(255);
  textSize(40);
  text("Press Enter to go back to menu", width / 2, height / 2 + 200);
}

void keyPressed() {
  switch (currentState) {
  case MENU_STATE:
    keyPressedInMenu();
    break;
  case GAME_STATE:
    keyPressedInGame();
    break;
  case PAUSED_STATE:
    keyPressedOnPause();
    break;
  case VICTORY_STATE:
    keyPressedInVictory(); // TODO
    break;
  }
}

void keyPressedInMenu() {
  if (keyCode == ENTER) {
    currentState = GAME_STATE;
  }
}

void keyPressedInGame() {
  drawGame();
  switch(key) {
  case 'p':
  case 'P':
    currentState = PAUSED_STATE;
    break; 
  }
}

void keyPressedOnPause() {
  if (keyCode == 'P') {
    currentState = GAME_STATE;
  }
}

void keyPressedInVictory() {
  if (keyCode == ENTER) {
    currentState = MENU_STATE;
  }
}
