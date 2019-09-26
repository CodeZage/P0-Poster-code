/*
This page is for everything concerning changes of page, in terms of resetting so the page to back to what it was before it was used.
*/
//GoBack button
void reloadButton() {
  
  //draws the circel for the button
  push();
  fill(highlight);
  noStroke();
  circle (width/2, subjectStart + (subjectAmount* subjectSizeY), navButtonRadius);

  //draws the line that goes through it
  push();
  stroke (highlight);
  strokeWeight (highlightWeight);
  line (0, subjectStart + (subjectAmount* subjectSizeY), width, subjectStart + (subjectAmount* subjectSizeY));
  pop();

  //Draw the hold arrow in the middle
  imageMode(CENTER);
  image(hold, width/2, subjectStart + (subjectAmount* subjectSizeY),navButtonRadius / 2,navButtonRadius / 2);
  
  
  // if mousex and mousey is equal to button coordinates and mouse is pressed the animation starts with time + 1 
  if (dist(width/2, subjectStart + (subjectAmount* subjectSizeY),mouseX,mouseY)<navButtonRadius/2 && mousePressed==true)
  {
    time += 1;
    
    // this is drawing the arc which shows how long to hold it
    noFill();
    strokeWeight(loadingStroke);
    stroke(loadingColor);
    arc(width/2, subjectStart + (subjectAmount* subjectSizeY), loadingButtonWidth, loadingButtonHeight, 0, radiant);
    
    // Animation timer for the arc
    if(time>0)
      {
      radiant += TWO_PI/holdDownTime;
      }
  }
  pop();
}
void dragMenu() {

  //draws the medialogi logo and text in the top at makes it follow the dragging motion
  image(medialogiLogo,0,navButtonY - subjectStart - ((subjectAmount) * subjectSizeY));
  push();

  //draws the circle and line in which you drag
  stroke (highlight);
  fill (highlight);
  strokeWeight (highlightWeight);
  line (widthStart, navButtonY, width, navButtonY);
  circle (width/2, navButtonY, navButtonRadius);

  //Draws the hand that indicates whether you have grabbed on or not
  push();
    imageMode(CENTER);
    if (navButtonClicked == true) {
      image(handGrab, width/2, navButtonY, navButtonRadius/2, navButtonRadius/3);
    } else {
      image(handPoint, width/2, navButtonY, navButtonRadius/2, navButtonRadius/2);
    }
  pop();
  pop();

  //pulls the dragmenu back to start if it has not been dragged far enough and it is no longer pressed
  if (navThreshold == false && navButtonY >= 135){
    navButtonY -= 30;
  } else if (navThreshold == false && navButtonY >= 105){
    navButtonY -= 20;  
  } else if (navThreshold == false && navButtonY >= 75){
    navButtonY = navButtonRadius;
  } else {
    navThreshold = true; 
  }
}

//Resets the subject if you go back from any of the information pages
void subjectResetter() {
  if (resizeSubject == true) {
    background(background);
    for (int i = 0; i < subjectAmount; i++) {
    subjectBoxes();
      if (chosenSubjectLeft[i] && sizeChanger > 0){

        //Descales and move the chosen box back to its original position and size
        image(subjectPictures[i], 0, (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
        sizeChanger--;
      }
      if (chosenSubjectRight[i] && sizeChanger > 0){

          //Descales and move the chosen box back to its original position and size
          image(subjectPictures[i + subjectAmount], width/2 - map(sizeChanger, 0, sizeChangerSpeed, 0, width/2), (subjectStart + (i * subjectSizeY)) - map(sizeChanger, 0, sizeChangerSpeed, 0, (subjectStart + (i * subjectSizeY))), map(sizeChanger, 0, sizeChangerSpeed, width / 2, width), map(sizeChanger, 0, sizeChangerSpeed, subjectSizeY, subjectStart));
          sizeChanger--;
      }
      if (sizeChanger == 0) {
        //resets the chosen subject
        Reset(chosenSubjectLeft);
        Reset(chosenSubjectRight);
        resizeSubject = false;
        pageNumber = 1;
      }
    }
  }
}

// Checks if the person has been idle for more than the designated amount of time, and if so go back to the frontpage
void idle() {
  if (idleTimer == resetTime && pageNumber != 0) {
    pageNumber = 0;
  } else if (pageNumber == 0) {
    idleTimer = 0;
  } else {
    idleTimer ++;
  }

  //checks that if the poster has been touch in anyway it will reset the timer
  if (mousePressed) {
    idleTimer = 0;
  }
}