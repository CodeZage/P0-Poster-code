int[] size;
boolean subjectChosen = false;
char subject;
boolean[] chosenSubjectLeft;
boolean[] chosenSubjectRight;
int subjectAmount = 3;
int sizeChanger = 0;
int subjectStart = 210;
int subjectSizeY = 150;
int sizeChangerSpeed = 15;
String[] subjectTexts;
int textDropDown = 0;
int textDropDownStart = -100;
int textEnd = 210;
int dropDownSpeed = 10;
//style
color highlight = (#E548E5);
color loadingColor = 255;

//Navigation button 
//int navButtonX = 300;
//int navButtonY = 700;
int navButtonWidth = 75;
int navButtonHeight = 75;

// loading button / arc
float radiant = 0;
int time;
//int loadingButtonX = navButtonX;
//int loadingButtonY = navButtonY;
int loadingButtonWidth = 55;
int loadingButtonHeight = 55;
int loadingStoke = 5;


void setup() {
 size(600, 849);               //sets size to A7 equivalent 
 frameRate(60);
 smooth(8);                     //sets anti-aliasing level to 8
 subjectTexts = loadStrings("text.txt");
 size = new int[100];
 chosenSubjectLeft = new boolean[subjectAmount];
 chosenSubjectRight = new boolean[subjectAmount];
}

//draw Step
void draw() {
  background(155);
  subjects();
  reloadButton();
}

void subjects() {
    for (int i = 0; i < subjectAmount; i++) {
      if (!chosenSubjectLeft[i]) {
      rect(0,subjectStart + (i * subjectSizeY),width/2,subjectSizeY);
      }
    }
    for (int i = 0; i < subjectAmount; i++) {
      if (!chosenSubjectRight[i]) {
      rect(width/2, subjectStart + (i* subjectSizeY),width/2,subjectSizeY);
      }
    }
    for (int i = 0; i < subjectAmount; i++) {
       if (chosenSubjectLeft[i] && sizeChanger < sizeChangerSpeed){
        rect(0, (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
        sizeChanger++;
      } else if (chosenSubjectLeft[i] && sizeChanger == sizeChangerSpeed) {
        if ( textDropDown < textEnd) {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i],10,textDropDown, width-20,subjectStart - textDropDownStart);
          pop();
          textDropDown += dropDownSpeed;
        } else {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i],10,textDropDown, width-20,subjectStart - textDropDownStart);
          text(subjectTexts[i], 100,100);
          pop();
        }
        rect(0,0,map(sizeChanger,0,sizeChangerSpeed,width/2,width), map(sizeChanger,0,sizeChangerSpeed,subjectSizeY,subjectStart));
      }
      if (chosenSubjectRight[i] && sizeChanger < sizeChangerSpeed){
        rect(width/2 - map(sizeChanger, 0, sizeChangerSpeed, 0, width/2), (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
        sizeChanger++;
      } else if (chosenSubjectRight[i] && sizeChanger == sizeChangerSpeed) {
        if ( textDropDown < textEnd) {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i + subjectAmount],10,textDropDown, width-20,subjectStart - textDropDownStart);
          text(subjectTexts[i + subjectAmount], 100,100);
          pop();
          textDropDown += dropDownSpeed;
        } else {
          rect(0, textDropDown, width, subjectStart - textDropDownStart);
          push();
          fill(0);
          textSize(50);
          text(subjectTexts[i + subjectAmount],10,textDropDown, width-20,subjectStart - textDropDownStart);
          text(subjectTexts[i + subjectAmount], 100,100);
          pop();
        }
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
       !chosenSubjectLeft[i]) {
         
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
       !chosenSubjectRight[i]) {
         
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
  ellipse (width/2, subjectStart + (subjectAmount* subjectSizeY), navButtonWidth, navButtonHeight);
  
  // if mousex and mousey is equal to button coordinates and mouse is pressed the animation starts with time + 1 
  if (dist(width/2, subjectStart + (subjectAmount* subjectSizeY),mouseX,mouseY)<navButtonWidth/2 && mousePressed==true)
  {
    time=+1;
    
    // this is the drawing and arc
    noFill();
    strokeWeight(loadingStoke);
    stroke(loadingColor);
    arc(width/2, subjectStart + (subjectAmount* subjectSizeY), loadingButtonWidth, loadingButtonHeight, 0, radiant);
    
    // animation starts here
    if(time>0 && time<40)
      {
      radiant=radiant+QUARTER_PI;
      }
    
    if(time>40 && time<80)
      {
      radiant=radiant+HALF_PI;
      }
    
    if(time>80 && time<120)
      {
      radiant=radiant+HALF_PI+QUARTER_PI;
      }
  }
  pop();
}
// her siger vi at time skal være 0 og radians er 0 grader når vi slipper, så den starter forfra
void mouseReleased() {
  time = 0;
  radiant = radians(0);
}
