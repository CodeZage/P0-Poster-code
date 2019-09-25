void mouseDragged(){
  if (pageNumber == 0) {
    
    if ((mouseX > width/2 - navButtonRadius /2 && 
        mouseX < width/2 + navButtonRadius /2 && 
        mouseY < navButtonY + navButtonRadius /2 && 
        mouseY < navButtonY + navButtonRadius /2 || 
        navButtonClicked == true) &&
        mouseY <= subjectStart + (subjectAmount* subjectSizeY)){
        navButtonClicked = true; 
        navButtonY = mouseY;
    } 
  }
}

// her siger vi at time skal være 0 og radians er 0 grader når vi slipper, så den starter forfra
void mouseReleased() {
  radiant = radians(0);
  if(pageNumber == 0) {
      navButtonClicked = false;
    if (navButtonY < subjectStart + ((subjectAmount-2) + subjectSizeY)){
      navThreshold = false;
    } else {
      navButtonY = subjectStart + ((subjectAmount-1)* subjectSizeY);
      pageNumber +=1;
    }
  }
  if (time > holdDownTime) {
    switch (pageNumber) {
      case 0 :
        pageNumber = 1;
        Reset(chosenSubjectLeft);
        Reset(chosenSubjectRight);
      break;
      default :
        navThreshold = false;
        pageNumber = pageNumber - 1;
        Reset(chosenSubjectLeft);
        Reset(chosenSubjectRight);
      break;  
    }
  }
  time = 0;
}

void mouseClicked() {
  if(pageNumber == 1 ){
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
}
