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
  arrowNext = loadImage("next.png");
  arrowPrevious = loadImage("previous.png");

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
  switch (pageNumber) {
    case 0 : // If it is the frontpage:
      image(frontPage,0,0);
      arrowAnimation(0);
      if (drawArrow){
        arrowAnimation(subjectStart + ((subjectAmount-1)* subjectSizeY));
      }
      subjectBoxes();
      dragMenu();
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
