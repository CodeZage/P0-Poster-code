int pageNumber = 0;

//subjects
boolean subjectChosen = false;
char subject;
boolean[] chosenSubjectLeft;
boolean[] chosenSubjectRight;
int subjectAmount = 3;
int sizeChanger = 0;
int subjectStart = 210;
int subjectSizeY = 150;
int sizeChangerSpeed = 15;

//TextBox and Text
String[] subjectTexts;
int textDropDown = 0;
int textDropDownStart = -240;
int textEnd = 210;
int dropDownSpeed = 10;

//style
color highlight = (#E548E5);
color loadingColor = 255;

// loading button / arc
float radiant = 0;
int time;
int loadingButtonWidth = 55;
int loadingButtonHeight = 55;
int loadingStoke = 5;
int holdDownTime = 30;

//Style 
int highlightWeight = 5;
int backgroundCol = (#FFFDF5);
int widthStart = 0;

//Navigation button 
int navButtonY = 50;
int navButtonRadius = 75;

//Checks 
boolean navButtonClicked = false; 
boolean navThreshold = true;

void setup() {
 size(600, 849);
 frameRate(60);
 smooth(8);                     //sets anti-aliasing level to 8
 subjectTexts = loadStrings("text.txt");
 chosenSubjectLeft = new boolean[subjectAmount];
 chosenSubjectRight = new boolean[subjectAmount];
}

//draw Step
void draw() {
  switch (pageNumber) {
    case 0 :
      background(155);
      stroke (highlight);
      fill (highlight);
      strokeWeight (highlightWeight);
      line (widthStart, navButtonY, width, navButtonY);
      circle (width/2, navButtonY, navButtonRadius);
  
      if (navThreshold == false && navButtonY >= 120){
        navButtonY -= 30;
      }
      if (navThreshold == false && navButtonY >= 100){
        navButtonY -= 20;  
      } 
      if (navThreshold == false && navButtonY >= 80){
        navButtonY -= 10;
      }
      else {
        navThreshold = true; 
      }
      Reset(chosenSubjectLeft);
      Reset(chosenSubjectRight);
      subjectChosen = false;
      break;	
    case 1 :
      background(155);
      subjects();
      reloadButton();
      break;
    case 2 :
      background(155);
      reloadButton();
      Reset(chosenSubjectLeft);
      Reset(chosenSubjectRight);
      subjectChosen = false;
      break;		
  }
}

void subjects() {
    //Draws the boxes on the left side
    for (int i = 0; i < subjectAmount; i++) {
      if (!chosenSubjectLeft[i]) {
      rect(0,subjectStart + (i * subjectSizeY),width/2,subjectSizeY);
      }
    }

    //Draws the boxes on the right side
    for (int i = 0; i < subjectAmount; i++) {
      if (!chosenSubjectRight[i]) {
      rect(width/2, subjectStart + (i* subjectSizeY),width/2,subjectSizeY);
      }
    }

    //Draws the chosen box if the chosen box is on the left side
    for (int i = 0; i < subjectAmount; i++) {

      //Scales and move the chosen box to the top and fit the screens width
      if (chosenSubjectLeft[i] && sizeChanger < sizeChangerSpeed){
        rect(0, (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
        sizeChanger++;

      //when the box is in the top
      } else if (chosenSubjectLeft[i] && sizeChanger == sizeChangerSpeed) {

        //begins to animate the textbox to dropdown
        if ( textDropDown < textEnd) {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i],10,textDropDown, width-20,subjectStart - textDropDownStart);
          pop();
          textDropDown += dropDownSpeed;

          //when the textbox has dropped down to the specific point keep drawing it there
        } else {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i],10,textDropDown, width-20,subjectStart - textDropDownStart);
          text(subjectTexts[i], 100,100);
          pop();
          pageNumber = 2;
        }

        //Draws the subject in the top
        rect(0,0,map(sizeChanger,0,sizeChangerSpeed,width/2,width), map(sizeChanger,0,sizeChangerSpeed,subjectSizeY,subjectStart));
      }

      //Draws the chosen box if the chosen box is on the left side
      if (chosenSubjectRight[i] && sizeChanger < sizeChangerSpeed){

        //Scales and move the chosen box to the top and fit the screens width
        rect(width/2 - map(sizeChanger, 0, sizeChangerSpeed, 0, width/2), (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
        sizeChanger++;

      //when the box is in the top
      } else if (chosenSubjectRight[i] && sizeChanger == sizeChangerSpeed) {

        //begins to animate the textbox to dropdown
        if ( textDropDown < textEnd) {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i + subjectAmount],10,textDropDown, width-20,subjectStart - textDropDownStart);
          pop();
          textDropDown += dropDownSpeed;

        //when the textbox has dropped down to the specific point keep drawing it there
        } else {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i + subjectAmount],10,textDropDown, width-20,subjectStart - textDropDownStart);
          pop();
          pageNumber = 2;
        }

        //Draws the subject in the top
        rect(0,0,map(sizeChanger,0,sizeChangerSpeed,width/2,width), map(sizeChanger,0,sizeChangerSpeed,subjectSizeY,subjectStart));
      }
    }
}

void mouseClicked() {
  for(int i = 0; i < subjectAmount; i++) { // for each row of subjects
    //Checks if the mouse is inside the the subject on the left side
    if(mouseX > 0 && mouseX < width/2 && 
       mouseY > subjectStart + (i * subjectSizeY) && 
       mouseY < subjectStart + ((i + 1) * subjectSizeY) && 
       !chosenSubjectLeft[i] &&
       dist(width/2, subjectStart + (subjectAmount* subjectSizeY),mouseX,mouseY) > navButtonRadius/2) {
         
         //resets the chosensubject
         Reset(chosenSubjectLeft);
         Reset(chosenSubjectRight);
         chosenSubjectLeft[i] = true;
         subjectChosen = true;
         textDropDown = textDropDownStart;
         sizeChanger = 0;
    }
    //Checks if the mouse is inside the the subject on the right side
    if(mouseX > width/2 && 
       mouseX < width && 
       mouseY > subjectStart + (i * subjectSizeY) && 
       mouseY < subjectStart + ((i + 1) * subjectSizeY) && 
       !chosenSubjectRight[i] &&
       dist(width/2, subjectStart + (subjectAmount* subjectSizeY),mouseX,mouseY) > navButtonRadius/2) {
         
         //resets the chosensubject
         Reset(chosenSubjectLeft);
         Reset(chosenSubjectRight);
         chosenSubjectRight[i] = true;
         subjectChosen = true;
         textDropDown = textDropDownStart;
         sizeChanger = 0;
    }
  }
}
// resets a boolean array to all false
void Reset(boolean[] d) {
  for (int i = 0; i < d.length; i++) { // For each array element,
    
    d[i] = false;//set the element to false
  }
}

//GoBack button
void reloadButton() {
  push();
  fill(highlight);
  noStroke();
  circle (width/2, subjectStart + (subjectAmount* subjectSizeY), navButtonRadius);
  
  // if mousex and mousey is equal to button coordinates and mouse is pressed the animation starts with time + 1 
  if (dist(width/2, subjectStart + (subjectAmount* subjectSizeY),mouseX,mouseY)<navButtonRadius/2 && mousePressed==true)
  {
    time += 1;
    
    // this is the drawing and arc
    noFill();
    strokeWeight(loadingStoke);
    stroke(loadingColor);
    arc(width/2, subjectStart + (subjectAmount* subjectSizeY), loadingButtonWidth, loadingButtonHeight, 0, radiant);
    
    // animation starts here
    if(time>0)
      {
      radiant += TWO_PI/holdDownTime;
      }
  }
  pop();
}

// her siger vi at time skal være 0 og radians er 0 grader når vi slipper, så den starter forfra
void mouseReleased() {
  println("time: "+time);
  if (time > holdDownTime) {
    time = 0;
    switch (pageNumber) {
      case 0 :
        pageNumber = 1;
      break;
      default :
        pageNumber -= 1;
      break;	
    }
  }
  time = 0;
  radiant = radians(0);
  if(pageNumber == 0) {
      navButtonClicked = false;
  
    if (navButtonY < 1100){
      navThreshold = false;
    }
  }
}

void mouseDragged(){
  if (pageNumber == 0) {
    
    if (mouseX > width - navButtonRadius /2 && 
        mouseX < width + navButtonRadius /2 && 
        mouseY < navButtonY + navButtonRadius /2 && 
        mouseY < navButtonY + navButtonRadius /2 || 
        navButtonClicked == true){
      
          navButtonClicked = true; 
          navButtonY = mouseY;
    } 
  }
}

void pagethree() {
  



}