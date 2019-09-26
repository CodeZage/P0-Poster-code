/*
Main file, setup and draw step
*/
void setup() {
  size(600, 849);
  frameRate(60);
  smooth(8);                     //sets anti-aliasing level to 8

  //loads Images from the data folder to variables
  frontPage = loadImage("frontpage2.png");
  medialogiLogo = loadImage("header.png");
  handPoint = loadImage("pointer.png");
  handGrab = loadImage("grapper.png");
  arrowNext = loadImage("nextT.png");
  arrowPrevious = loadImage("previousT.png");
  hold = loadImage("hold.png");

  //Resizes the arrays to match the amount of subjects
  chosenSubjectLeft = new boolean[subjectAmount];
  chosenSubjectRight = new boolean[subjectAmount];
  subjectPictures = new PImage[subjectAmount * 2];
  textImages = new PImage[subjectAmount * 2];

  //resizes the array to fit all the pictures in the arrow animation
  arrowArray = new PImage[arrowAnimationLength];
  
  //loads in the images in sequence into their respective arrays
  for(int i = 0; i < 2 * subjectAmount; i++) {
    subjectPictures[i] = loadImage(dataPath("subjects") + '/' + "Subject" + i + ".png");
    textImages[i] = loadImage(dataPath("text") + '/' + "Text" + i + ".png");
  }
  for(int i = 0; i < arrowAnimationLength; i++) {
    arrowArray[i] = loadImage(dataPath("Arrow") + '/' + "arrow0" + i + ".png");
  }
}

//draw Step
void draw() {
  idle();
  println("idleTimer: "+idleTimer);
  switch (pageNumber) {
    case 0 : // If it is the frontpage:
      background(background);

      // Draw frontPage picture and make it fade when you drag down the menu
      push();
      tint(255,255 - map(navButtonY, navButtonRadius, subjectStart + (subjectAmount* subjectSizeY), 0, 255));
      image(frontPage,0,0);
      pop();

      // Arrow animation
      arrowAnimation(0);
      if (navButtonClicked == true){
        arrowAnimation(subjectStart + ((subjectAmount-1)* subjectSizeY));
      }

      // Draw the subjectBoxes and makes them follow the menu down
      subjectBoxes();
      push();
      noStroke();
      fill(background,255 - map(navButtonY, navButtonRadius, subjectStart, 0, 255));
      rect(0, 0, width, navButtonRadius);
      pop();
      dragMenu();

      //resets the chosensubject
      Reset(chosenSubjectLeft);
      Reset(chosenSubjectRight);
      subjectChosen = false;
      break;	

    case 1 : // If it is the subject choosing page:
      background(background);
      subjects();
      reloadButton();
      navThreshold = false;
      break;

    case 2 : // If it is the subject information page:
      background(background);
      subjectBoxes();
      subjectPageThree();
      subjectResetter();
      reloadButton();
      break;		
  }
}
