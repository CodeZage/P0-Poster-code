/*
This page is for everything concerning interaction and user-input
*/
void mouseDragged(){
  if (pageNumber == 0) {

    // checks if the mouse is inside of the Dragable button on page 0, and that it is inside the boundary of the designated drag-zone
    if ((mouseX > width/2 - navButtonRadius /2 && 
        mouseX < width/2 + navButtonRadius /2 && 
        mouseY < navButtonY + navButtonRadius /2 && 
        mouseY < navButtonY + navButtonRadius /2 || 
        navButtonClicked == true) &&
        mouseY <= subjectStart + (subjectAmount* subjectSizeY) && mouseY > navButtonRadius){

          // makes the navButton follow the mouse and stops drawing the arrows
          navButtonClicked = true; 
          navButtonY = mouseY;
    } 
  }
}

// Makes sures that the dragable menu stays on the mouse when you stop dragging but is still pressing
void mousePressed() {
  if (navButtonClicked) {
    navButtonY = mouseY;
  }
}

// her siger vi at time skal være 0 og radians er 0 grader når vi slipper, så den starter forfra
void mouseReleased() {
  radiant = radians(0);

  // checks if the dragable menu is dragged past the turning point, and if so either goes back to or goes all the way down and changes pages
  if(pageNumber == 0) {
      navButtonClicked = false;
    if (navButtonY < subjectStart + subjectSizeY){
      navThreshold = false;
    } else {
      navButtonY = subjectStart + ((subjectAmount-1)* subjectSizeY);
      pageNumber +=1;
    }
  }

  // checks wether the return buttorn has been pressed for long enough or not
  if (time > holdDownTime) {
    switch (pageNumber) {

      case 0 : // If it is the frontpage:
        pageNumber = 1;
        Reset(chosenSubjectLeft);
        Reset(chosenSubjectRight);
      break;

      case 1 : // If it is the subject Chooser page:
        navThreshold = false;
        pageNumber = pageNumber - 1;
        Reset(chosenSubjectLeft);
        Reset(chosenSubjectRight);
      break;  	

      case 2: // If it is the Subject information page:
        resizeSubject = true;
        break;
        
    }
  }
  time = 0; // resets Time
}

void mouseClicked() {
  //If the page is the Subject Chooser page:
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

  // else if the page is the Subject information page:
  } else if(pageNumber == 2){

    //checks if the mouse is clicked inside the left arrow and it is not the first subject
    if (mouseX < 50 && mouseY < subjectStart && !chosenSubjectLeft[0]) {
    
      // checks which subject is the chosen and then changes it to the previous subject
      for(int i = 0; i < subjectAmount; i++){
        if(chosenSubjectLeft[i] == true) {
          chosenSubjectRight[i-1] = true;
          chosenSubjectLeft[i] = false;
        } else if (chosenSubjectRight[i] == true) {
          chosenSubjectLeft[i] = true;
          chosenSubjectRight[i] = false;
        }
      }
    //checks if the mouse is clicked inside the right arrow and it is not the last subject  
    } else if (mouseX > width - 50 && mouseY < subjectStart && !chosenSubjectRight[2]) {

      // checks which subject is the chosen and then changes it to the next subject
      for(int i = 0; i < subjectAmount; i++){
        if(chosenSubjectLeft[i] == true) {
          chosenSubjectRight[i] = true;
          chosenSubjectLeft[i] = false;
        } else if (chosenSubjectRight[i] == true) {
          chosenSubjectLeft[i+1] = true;
          chosenSubjectRight[i] = false;
          break;
        }
      }
    }
  }
}
