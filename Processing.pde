// ======================================================
// EMOTION GARDEN
// Creative Coding Project
//
// This project has four emotion scenes:
// 1 = Happy
// 2 = Calm
// 3 = Sad
// 4 = Angry
//
// The user can press keys 1–4 or click the buttons
// at the bottom of the screen to change scenes.
// ======================================================


// ------------------------------------------------------
// SCENE CONTROL
// ------------------------------------------------------

// This variable remembers which scene is currently showing.
// It starts at 1, so the Happy scene appears first.
int scene = 1;


// ------------------------------------------------------
// HAPPY SCENE VARIABLES
// ------------------------------------------------------

// Controls the size of the flowers.
// It starts at 0 and slowly grows to 1,
// creating the flower blooming animation.
float bloomSize = 0;

// Controls the horizontal position of the butterfly.
// A negative value starts the butterfly outside the screen.
float butterflyX = -50;


// ------------------------------------------------------
// CALM SCENE VARIABLES
// ------------------------------------------------------

// These variables control the horizontal positions
// of the two moving clouds.
float cloudX1 = 100;
float cloudX2 = 500;

// Number of falling petals in the Calm scene.
int petalCount = 35;

// These arrays store information for each petal.
// Every petal needs its own X position, Y position
// and falling speed.
float[] petalX = new float[petalCount];
float[] petalY = new float[petalCount];
float[] petalSpeed = new float[petalCount];


// ------------------------------------------------------
// SAD SCENE VARIABLES
// ------------------------------------------------------

// Number of raindrops shown in the Sad scene.
int rainCount = 80;

// These arrays store the position and speed
// of every raindrop.
float[] rainX = new float[rainCount];
float[] rainY = new float[rainCount];
float[] rainSpeed = new float[rainCount];


// ------------------------------------------------------
// ANGRY SCENE VARIABLES
// ------------------------------------------------------

// Number of leaves flying in the Angry scene.
int leafCount = 25;

// These arrays store the position, speed
// and rotation angle of every leaf.
float[] leafX = new float[leafCount];
float[] leafY = new float[leafCount];
float[] leafSpeed = new float[leafCount];
float[] leafAngle = new float[leafCount];

// Controls the movement of the wind lines.
float windOffset = 0;


// ======================================================
// SETUP
// ======================================================

void setup() {

  // Creates the program window.
  // Width = 900 pixels, height = 600 pixels.
  size(900, 600);

  // Makes circles and shapes look smoother.
  smooth();


  // ----------------------------------------------------
  // CREATE CALM PETALS
  // ----------------------------------------------------

  // This loop gives every petal a random starting
  // position and falling speed.
  for (int i = 0; i < petalCount; i++) {

    // Random horizontal position across the screen.
    petalX[i] = random(width);

    // Some petals begin above the screen,
    // so they do not all appear at the same time.
    petalY[i] = random(-500, 400);

    // Gives every petal a slightly different speed.
    petalSpeed[i] = random(0.5, 1.5);
  }


  // ----------------------------------------------------
  // CREATE SAD RAIN
  // ----------------------------------------------------

  for (int i = 0; i < rainCount; i++) {

    // Random horizontal position.
    rainX[i] = random(width);

    // Random starting height.
    rainY[i] = random(-600, 500);

    // Different falling speeds make the rain
    // look more natural.
    rainSpeed[i] = random(5, 10);
  }


  // ----------------------------------------------------
  // CREATE ANGRY LEAVES
  // ----------------------------------------------------

  for (int i = 0; i < leafCount; i++) {

    // Random starting position.
    leafX[i] = random(width);
    leafY[i] = random(100, 450);

    // Random horizontal speed.
    leafSpeed[i] = random(5, 10);

    // Random starting rotation.
    leafAngle[i] = random(TWO_PI);
  }
}


// ======================================================
// DRAW
// ======================================================

void draw() {

  // draw() runs again and again every second.
  // This repeated drawing creates animation.


  // Show Happy when scene = 1.
  if (scene == 1) {
    happyScene();
  }

  // Show Calm when scene = 2.
  if (scene == 2) {
    calmScene();
  }

  // Show Sad when scene = 3.
  if (scene == 3) {
    sadScene();
  }

  // Show Angry when scene = 4.
  if (scene == 4) {
    angryScene();
  }

  // Draw the four scene buttons on top of every scene.
  drawButtons();
}


// ======================================================
// HAPPY SCENE
// ======================================================

void happyScene() {

  // Light blue background represents a bright sky.
  background(170, 220, 255);


  // ---------------- GRASS ----------------

  // Removes the outline from shapes.
  noStroke();

  // Green colour.
  fill(110, 190, 90);

  // Draws the grass at the bottom.
  rect(0, 400, width, 150);


  // ---------------- SUN ----------------

  // Yellow colour.
  fill(255, 220, 70);

  // Draws the sun.
  ellipse(760, 100, 110, 110);


  // ---------------- FLOWERS ----------------

  // The drawHappyFlower function is reused
  // to create several flowers in different positions.
  drawHappyFlower(150, 450);
  drawHappyFlower(300, 430);
  drawHappyFlower(450, 460);
  drawHappyFlower(600, 425);
  drawHappyFlower(750, 455);


  // ---------------- BLOOM ANIMATION ----------------

  // bloomSize slowly increases from 0 to 1.
  // This makes the flowers grow from small to full size.
  if (bloomSize < 1) {
    bloomSize = bloomSize + 0.01;
  }


  // ---------------- BUTTERFLY ----------------

  // Draws the butterfly at its current position.
  drawButterfly(butterflyX, 180);

  // Moves the butterfly two pixels to the right
  // every frame.
  butterflyX = butterflyX + 2;

  // When the butterfly leaves the right side,
  // it starts again from the left.
  if (butterflyX > width + 50) {
    butterflyX = -50;
  }


  // Shows the scene name.
  sceneTitle("HAPPY");
}


// ======================================================
// HAPPY FLOWER
// ======================================================

void drawHappyFlower(float x, float y) {

  // x and y allow this same function
  // to draw flowers in different positions.


  // ---------------- STEM ----------------

  stroke(60, 140, 70);
  strokeWeight(5);

  // Draws the green flower stem.
  line(x, y, x, y - 110);


  // pushMatrix saves the current drawing position.
  pushMatrix();

  // Moves the drawing point to the flower head.
  translate(x, y - 110);

  // Changes the flower size using bloomSize.
  scale(bloomSize);


  // ---------------- PETALS ----------------

  noStroke();

  // Pink petal colour.
  fill(255, 145, 190);

  // Five circles create the flower petals.
  ellipse(0, -25, 45, 45);
  ellipse(-30, 0, 45, 45);
  ellipse(30, 0, 45, 45);
  ellipse(-20, 28, 45, 45);
  ellipse(20, 28, 45, 45);


  // ---------------- FLOWER CENTRE ----------------

  fill(255, 210, 60);

  // Yellow centre of the flower.
  ellipse(0, 5, 40, 40);


  // Restores the original drawing position.
  popMatrix();
}


// ======================================================
// BUTTERFLY
// ======================================================

void drawButterfly(float x, float y) {

  noStroke();


  // ---------------- WINGS ----------------

  // Pink wings.
  fill(255, 120, 190);

  ellipse(x - 15, y, 35, 28);
  ellipse(x + 15, y, 35, 28);


  // ---------------- BODY ----------------

  fill(70, 50, 60);

  ellipse(x, y, 9, 30);


  // ---------------- ANTENNA ----------------

  stroke(70, 50, 60);
  strokeWeight(2);

  line(x - 2, y - 14, x - 10, y - 25);
  line(x + 2, y - 14, x + 10, y - 25);
}


// ======================================================
// CALM SCENE
// ======================================================

void calmScene() {

  // Soft blue background creates a calm feeling.
  background(170, 215, 245);


  // ---------------- GROUND ----------------

  noStroke();

  fill(145, 200, 150);

  rect(0, 420, width, 130);


  // ---------------- CLOUDS ----------------

  // Draw two clouds.
  drawCloud(cloudX1, 130);
  drawCloud(cloudX2, 220);

  // Move both clouds slowly to the right.
  // Different speeds create more natural movement.
  cloudX1 = cloudX1 + 0.4;
  cloudX2 = cloudX2 + 0.25;

  // Restart cloud 1 after it leaves the screen.
  if (cloudX1 > width + 100) {
    cloudX1 = -150;
  }

  // Restart cloud 2.
  if (cloudX2 > width + 100) {
    cloudX2 = -150;
  }


  // ---------------- FALLING PETALS ----------------

  // This loop draws and moves every petal.
  for (int i = 0; i < petalCount; i++) {

    noStroke();

    // Soft pink colour.
    fill(255, 185, 210);

    // Draw the petal.
    ellipse(petalX[i], petalY[i], 12, 7);

    // Move the petal down.
    petalY[i] = petalY[i] + petalSpeed[i];

    // sin() creates a gentle left and right movement,
    // making the petals look like they are floating.
    petalX[i] =
      petalX[i] + sin(petalY[i] * 0.02) * 0.5;

    // When a petal reaches the bottom,
    // move it back above the screen.
    if (petalY[i] > 530) {

      petalY[i] = random(-100, 0);
      petalX[i] = random(width);
    }
  }


  sceneTitle("CALM");
}


// ======================================================
// CLOUD
// ======================================================

void drawCloud(float x, float y) {

  noStroke();

  // Almost-white colour.
  fill(255, 245);

  // Three overlapping circles create one cloud.
  ellipse(x, y, 90, 50);
  ellipse(x + 40, y - 10, 80, 60);
  ellipse(x + 80, y, 90, 50);
}


// ======================================================
// SAD SCENE
// ======================================================

void sadScene() {

  // Grey background creates a sad mood.
  background(120, 135, 150);


  // ---------------- GROUND ----------------

  noStroke();

  fill(75, 100, 85);

  rect(0, 420, width, 130);


  // ---------------- DARK CLOUDS ----------------

  drawSadCloud(150, 110);
  drawSadCloud(500, 150);


  // ---------------- RAIN ----------------

  stroke(180, 210, 230);
  strokeWeight(2);

  // Draw and move every raindrop.
  for (int i = 0; i < rainCount; i++) {

    // A short diagonal line represents one raindrop.
    line(
      rainX[i],
      rainY[i],
      rainX[i] - 5,
      rainY[i] + 18
    );

    // Move the raindrop down.
    rainY[i] = rainY[i] + rainSpeed[i];

    // When the raindrop reaches the bottom,
    // restart it above the screen.
    if (rainY[i] > 540) {

      rainY[i] = random(-200, 0);
      rainX[i] = random(width);
    }
  }


  // ---------------- SAD FLOWERS ----------------

  drawSadFlower(250, 460);
  drawSadFlower(450, 460);
  drawSadFlower(650, 460);


  sceneTitle("SAD");
}


// ======================================================
// SAD CLOUD
// ======================================================

void drawSadCloud(float x, float y) {

  noStroke();

  // Dark grey colour.
  fill(80, 90, 105);

  // Three ellipses create a cloud.
  ellipse(x, y, 100, 55);
  ellipse(x + 45, y - 10, 90, 65);
  ellipse(x + 90, y, 100, 55);
}


// ======================================================
// SAD FLOWER
// ======================================================

void drawSadFlower(float x, float y) {

  // ---------------- BENT STEM ----------------

  stroke(60, 105, 65);
  strokeWeight(5);

  // Two lines make the stem look bent downward.
  line(x, y, x - 15, y - 70);
  line(x - 15, y - 70, x - 35, y - 105);


  // ---------------- DROOPING FLOWER ----------------

  noStroke();

  fill(120, 100, 150);

  // Petals point downward to show sadness.
  ellipse(x - 45, y - 105, 35, 25);
  ellipse(x - 30, y - 115, 35, 25);
  ellipse(x - 20, y - 100, 35, 25);

  fill(100, 80, 110);

  ellipse(x - 32, y - 103, 25, 25);
}


// ======================================================
// ANGRY SCENE
// ======================================================

void angryScene() {

  // Red background represents anger.
  background(220, 70, 50);


  // ---------------- GROUND ----------------

  noStroke();

  fill(100, 60, 45);

  rect(0, 420, width, 130);


  // ---------------- ORANGE SUN ----------------

  fill(255, 125, 30);

  ellipse(750, 100, 120, 120);


  // ---------------- WIND ----------------

  stroke(255, 190, 130);
  strokeWeight(3);

  // Increase windOffset quickly,
  // creating fast horizontal movement.
  windOffset = windOffset + 7;

  // Draw six moving wind lines.
  for (int i = 0; i < 6; i++) {

    // Gives every wind line a different height.
    float y = 120 + i * 55;

    // Calculates the horizontal position
    // of each moving wind line.
    float x =
      (windOffset + i * 170) %
      (width + 200) - 100;

    // Draw the wind line.
    line(x, y, x + 120, y);
  }


  // ---------------- FLYING LEAVES ----------------

  for (int i = 0; i < leafCount; i++) {

    // Save the normal coordinate system.
    pushMatrix();

    // Move the drawing point to the leaf position.
    translate(leafX[i], leafY[i]);

    // Rotate the leaf.
    rotate(leafAngle[i]);

    noStroke();

    fill(130, 70, 30);

    // Draw the leaf as an oval.
    ellipse(0, 0, 28, 12);

    // Return to the normal coordinate system.
    popMatrix();


    // Move the leaf quickly to the right.
    leafX[i] = leafX[i] + leafSpeed[i];

    // Gives the leaf a small up-and-down movement.
    leafY[i] =
      leafY[i] +
      sin(frameCount * 0.1 + i) * 1.5;

    // Continuously rotate the leaf.
    leafAngle[i] = leafAngle[i] + 0.15;


    // When a leaf leaves the screen,
    // restart it from the left.
    if (leafX[i] > width + 30) {

      leafX[i] = -30;

      leafY[i] = random(100, 430);
    }
  }


  sceneTitle("ANGRY");
}


// ======================================================
// SCENE TITLE
// ======================================================

void sceneTitle(String name) {

  // White text.
  fill(255);

  // Centre the title.
  textAlign(CENTER, CENTER);

  // Text size.
  textSize(32);

  // Draw the scene name at the top.
  text(name, width / 2, 45);
}


// ======================================================
// SCENE BUTTONS
// ======================================================

void drawButtons() {

  // Height of the bottom buttons.
  float buttonHeight = 50;

  // Divide the screen equally into four buttons.
  float buttonWidth = width / 4.0;

  // Place buttons at the bottom of the screen.
  float y = height - buttonHeight;

  noStroke();


  // Draw the Happy button.
  drawButton(
    0,
    y,
    buttonWidth,
    buttonHeight,
    "1  HAPPY",
    scene == 1
  );


  // Draw the Calm button.
  drawButton(
    buttonWidth,
    y,
    buttonWidth,
    buttonHeight,
    "2  CALM",
    scene == 2
  );


  // Draw the Sad button.
  drawButton(
    buttonWidth * 2,
    y,
    buttonWidth,
    buttonHeight,
    "3  SAD",
    scene == 3
  );


  // Draw the Angry button.
  drawButton(
    buttonWidth * 3,
    y,
    buttonWidth,
    buttonHeight,
    "4  ANGRY",
    scene == 4
  );
}


// ======================================================
// DRAW ONE BUTTON
// ======================================================

void drawButton(
  float x,
  float y,
  float w,
  float h,
  String label,
  boolean active
) {

  // If this button represents the current scene,
  // make it lighter.
  if (active) {
    fill(255, 220);
  }

  // Other buttons are darker.
  else {
    fill(30, 150);
  }


  // Draw the button rectangle.
  rect(x, y, w, h);


  // Active button uses dark text.
  if (active) {
    fill(50);
  }

  // Inactive buttons use white text.
  else {
    fill(255);
  }


  // Centre the button text.
  textAlign(CENTER, CENTER);

  textSize(16);

  // Display the button label.
  text(
    label,
    x + w / 2,
    y + h / 2
  );
}


// ======================================================
// KEYBOARD INTERACTION
// ======================================================

void keyPressed() {

  // keyPressed() runs when the user presses a key.


  // Press 1 = Happy.
  if (key == '1') {
    changeScene(1);
  }

  // Press 2 = Calm.
  if (key == '2') {
    changeScene(2);
  }

  // Press 3 = Sad.
  if (key == '3') {
    changeScene(3);
  }

  // Press 4 = Angry.
  if (key == '4') {
    changeScene(4);
  }
}


// ======================================================
// MOUSE INTERACTION
// ======================================================

void mousePressed() {

  // mousePressed() runs whenever the user clicks.


  // Only change scenes if the user clicks
  // inside the bottom button area.
  if (mouseY > height - 50) {

    // Calculate the width of each button.
    float buttonWidth = width / 4.0;


    // First quarter = Happy.
    if (mouseX < buttonWidth) {
      changeScene(1);
    }


    // Second quarter = Calm.
    else if (mouseX < buttonWidth * 2) {
      changeScene(2);
    }


    // Third quarter = Sad.
    else if (mouseX < buttonWidth * 3) {
      changeScene(3);
    }


    // Final quarter = Angry.
    else {
      changeScene(4);
    }
  }
}


// ======================================================
// CHANGE SCENE
// ======================================================

void changeScene(int newScene) {

  // Change the current scene.
  scene = newScene;


  // If the user returns to Happy,
  // restart the flower blooming animation
  // and butterfly position.
  if (scene == 1) {

    bloomSize = 0;

    butterflyX = -50;
  }
}
