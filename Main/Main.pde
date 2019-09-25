void setup() {
 size(600, 849);
 frameRate(60);
 smooth(8);                     //sets anti-aliasing level to 8
 subjectTexts = loadStrings("text.txt");
 chosenSubjectLeft = new boolean[subjectAmount];
 chosenSubjectRight = new boolean[subjectAmount];
 subjectPictures = new PImage[subjectAmount * 2];
 for(int i = 0;i < 2 * subjectAmount; i++) {
   subjectPictures[i] = loadImage("Subject" + i + ".png");
 }
}

//draw Step
void draw() {
  switch (pageNumber) {
    case 0 :
      background(background);
      subjectBoxes();
      dragMenu();
      Reset(chosenSubjectLeft);
      Reset(chosenSubjectRight);
      subjectChosen = false;
      break;	
    case 1 :
      background(background);
      subjects();
      reloadButton();
      navThreshold = false;
      break;
    case 2 :
      background(background);
      subjectText();
      reloadButton();
      subjectChosen = false;
      break;		
  }
}
